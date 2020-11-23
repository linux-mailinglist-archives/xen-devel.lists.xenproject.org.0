Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99A2C128E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 19:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35010.66420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khG8x-0000zI-Io; Mon, 23 Nov 2020 18:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35010.66420; Mon, 23 Nov 2020 18:00:51 +0000
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
	id 1khG8x-0000wZ-1p; Mon, 23 Nov 2020 18:00:51 +0000
Received: by outflank-mailman (input) for mailman id 35010;
 Mon, 23 Nov 2020 18:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khG8r-0000mh-Hi
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khG8q-00070t-G3; Mon, 23 Nov 2020 18:00:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtm-0000at-9L; Mon, 23 Nov 2020 17:45:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khG8r-0000mh-Hi
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 18:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=8fS6RrvvdnuNUI/KdahI5cH7K76QmmNtKDWTvY4ag4k=; b=F1v4i8wXRK5RYACrnqI0QCW3u
	u+a9PDTSdB9N5wLo6gXkWVBsY5e2xnGh3IbcOjHxl3cWYgse6VIOx/vtCgrUgQcG+y34fJP+xMb31
	Bnx1jC9rYm4UY10x8ZdEnjiKuglPoDr3hOBQM9JuUJ5rr9I5NcBA7rd6YBemBX3QmCo8Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khG8q-00070t-G3; Mon, 23 Nov 2020 18:00:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtm-0000at-9L; Mon, 23 Nov 2020 17:45:10 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 17/23] libxl: introduce 'libxl_pci_bdf' in the idl...
Date: Mon, 23 Nov 2020 17:44:57 +0000
Message-Id: <20201123174503.6800-18-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

... and use in 'libxl_device_pci'

This patch is preparatory work for restricting the type passed to functions
that only require BDF information, rather than passing a 'libxl_device_pci'
structure which is only partially filled. In this patch only the minimal
mechanical changes necessary to deal with the structural changes are made.
Subsequent patches will adjust the code to make better use of the new type.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/helpers.gen.go |  77 ++++++++++++------
 tools/golang/xenlight/types.gen.go   |   8 +-
 tools/include/libxl.h                |   6 ++
 tools/libs/light/libxl_dm.c          |   8 +-
 tools/libs/light/libxl_internal.h    |   3 +-
 tools/libs/light/libxl_pci.c         | 148 +++++++++++++++++------------------
 tools/libs/light/libxl_types.idl     |  16 ++--
 tools/libs/util/libxlu_pci.c         |   8 +-
 tools/xl/xl_pci.c                    |   6 +-
 tools/xl/xl_sxp.c                    |   4 +-
 10 files changed, 167 insertions(+), 117 deletions(-)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index c8605994e7..b7230f693c 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1999,6 +1999,41 @@ xc.colo_checkpoint_port = C.CString(x.ColoCheckpointPort)}
  return nil
  }
 
+// NewPciBdf returns an instance of PciBdf initialized with defaults.
+func NewPciBdf() (*PciBdf, error) {
+var (
+x PciBdf
+xc C.libxl_pci_bdf)
+
+C.libxl_pci_bdf_init(&xc)
+defer C.libxl_pci_bdf_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *PciBdf) fromC(xc *C.libxl_pci_bdf) error {
+ x.Func = byte(xc._func)
+x.Dev = byte(xc.dev)
+x.Bus = byte(xc.bus)
+x.Domain = int(xc.domain)
+
+ return nil}
+
+func (x *PciBdf) toC(xc *C.libxl_pci_bdf) (err error){defer func(){
+if err != nil{
+C.libxl_pci_bdf_dispose(xc)}
+}()
+
+xc._func = C.uint8_t(x.Func)
+xc.dev = C.uint8_t(x.Dev)
+xc.bus = C.uint8_t(x.Bus)
+xc.domain = C.int(x.Domain)
+
+ return nil
+ }
+
 // NewDevicePci returns an instance of DevicePci initialized with defaults.
 func NewDevicePci() (*DevicePci, error) {
 var (
@@ -2014,10 +2049,9 @@ return nil, err }
 return &x, nil}
 
 func (x *DevicePci) fromC(xc *C.libxl_device_pci) error {
- x.Func = byte(xc._func)
-x.Dev = byte(xc.dev)
-x.Bus = byte(xc.bus)
-x.Domain = int(xc.domain)
+ if err := x.Bdf.fromC(&xc.bdf);err != nil {
+return fmt.Errorf("converting field Bdf: %v", err)
+}
 x.Vdevfn = uint32(xc.vdevfn)
 x.VfuncMask = uint32(xc.vfunc_mask)
 x.Msitranslate = bool(xc.msitranslate)
@@ -2033,10 +2067,9 @@ if err != nil{
 C.libxl_device_pci_dispose(xc)}
 }()
 
-xc._func = C.uint8_t(x.Func)
-xc.dev = C.uint8_t(x.Dev)
-xc.bus = C.uint8_t(x.Bus)
-xc.domain = C.int(x.Domain)
+if err := x.Bdf.toC(&xc.bdf); err != nil {
+return fmt.Errorf("converting field Bdf: %v", err)
+}
 xc.vdevfn = C.uint32_t(x.Vdevfn)
 xc.vfunc_mask = C.uint32_t(x.VfuncMask)
 xc.msitranslate = C.bool(x.Msitranslate)
@@ -2766,13 +2799,13 @@ if err := x.Nics[i].fromC(&v); err != nil {
 return fmt.Errorf("converting field Nics: %v", err) }
 }
 }
-x.Pcidevs = nil
-if n := int(xc.num_pcidevs); n > 0 {
-cPcidevs := (*[1<<28]C.libxl_device_pci)(unsafe.Pointer(xc.pcidevs))[:n:n]
-x.Pcidevs = make([]DevicePci, n)
-for i, v := range cPcidevs {
-if err := x.Pcidevs[i].fromC(&v); err != nil {
-return fmt.Errorf("converting field Pcidevs: %v", err) }
+x.Pcis = nil
+if n := int(xc.num_pcis); n > 0 {
+cPcis := (*[1<<28]C.libxl_device_pci)(unsafe.Pointer(xc.pcis))[:n:n]
+x.Pcis = make([]DevicePci, n)
+for i, v := range cPcis {
+if err := x.Pcis[i].fromC(&v); err != nil {
+return fmt.Errorf("converting field Pcis: %v", err) }
 }
 }
 x.Rdms = nil
@@ -2922,13 +2955,13 @@ return fmt.Errorf("converting field Nics: %v", err)
 }
 }
 }
-if numPcidevs := len(x.Pcidevs); numPcidevs > 0 {
-xc.pcidevs = (*C.libxl_device_pci)(C.malloc(C.ulong(numPcidevs)*C.sizeof_libxl_device_pci))
-xc.num_pcidevs = C.int(numPcidevs)
-cPcidevs := (*[1<<28]C.libxl_device_pci)(unsafe.Pointer(xc.pcidevs))[:numPcidevs:numPcidevs]
-for i,v := range x.Pcidevs {
-if err := v.toC(&cPcidevs[i]); err != nil {
-return fmt.Errorf("converting field Pcidevs: %v", err)
+if numPcis := len(x.Pcis); numPcis > 0 {
+xc.pcis = (*C.libxl_device_pci)(C.malloc(C.ulong(numPcis)*C.sizeof_libxl_device_pci))
+xc.num_pcis = C.int(numPcis)
+cPcis := (*[1<<28]C.libxl_device_pci)(unsafe.Pointer(xc.pcis))[:numPcis:numPcis]
+for i,v := range x.Pcis {
+if err := v.toC(&cPcis[i]); err != nil {
+return fmt.Errorf("converting field Pcis: %v", err)
 }
 }
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b4c5df0f2c..bc62ae8ce9 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -707,11 +707,15 @@ ColoCheckpointHost string
 ColoCheckpointPort string
 }
 
-type DevicePci struct {
+type PciBdf struct {
 Func byte
 Dev byte
 Bus byte
 Domain int
+}
+
+type DevicePci struct {
+Bdf PciBdf
 Vdevfn uint32
 VfuncMask uint32
 Msitranslate bool
@@ -896,7 +900,7 @@ CInfo DomainCreateInfo
 BInfo DomainBuildInfo
 Disks []DeviceDisk
 Nics []DeviceNic
-Pcidevs []DevicePci
+Pcis []DevicePci
 Rdms []DeviceRdm
 Dtdevs []DeviceDtdev
 Vfbs []DeviceVfb
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 8225809d94..5edacccbd1 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -464,6 +464,12 @@
 #define LIBXL_HAVE_DEVICE_PCI_ASSIGNABLE_LIST_FREE 1
 
 /*
+ * LIBXL_HAVE_PCI_BDF indicates that the 'libxl_pci_bdf' type is defined
+ * is embedded in the 'libxl_device_pci' type.
+ */
+#define LIBXL_HAVE_PCI_BDF 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 8ebe1b60c9..a25bf23834 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -472,10 +472,10 @@ int libxl__domain_device_construct_rdm(libxl__gc *gc,
     for (i = 0; i < d_config->num_pcis; i++) {
         unsigned int n, nr_entries;
 
-        seg = d_config->pcis[i].domain;
-        bus = d_config->pcis[i].bus;
-        devfn = PCI_DEVFN(d_config->pcis[i].dev,
-                          d_config->pcis[i].func);
+        seg = d_config->pcis[i].bdf.domain;
+        bus = d_config->pcis[i].bdf.bus;
+        devfn = PCI_DEVFN(d_config->pcis[i].bdf.dev,
+                          d_config->pcis[i].bdf.func);
         nr_entries = 0;
         rc = libxl__xc_device_get_rdm(gc, 0,
                                       seg, bus, devfn, &nr_entries, &xrdm);
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 02f8a3179c..da12d92209 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4746,10 +4746,11 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx,
  * devices have same identifier. */
 #define COMPARE_DEVID(a, b) ((a)->devid == (b)->devid)
 #define COMPARE_DISK(a, b) (!strcmp((a)->vdev, (b)->vdev))
-#define COMPARE_PCI(a, b) ((a)->domain == (b)->domain && \
+#define COMPARE_BDF(a, b) ((a)->domain == (b)->domain && \
                            (a)->bus == (b)->bus &&       \
                            (a)->dev == (b)->dev &&       \
                            (a)->func == (b)->func)
+#define COMPARE_PCI(a, b) COMPARE_BDF(&((a)->bdf), &((b)->bdf))
 #define COMPARE_USB(a, b) ((a)->ctrl == (b)->ctrl && \
                            (a)->port == (b)->port)
 #define COMPARE_USBCTRL(a, b) ((a)->devid == (b)->devid)
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index e0b616fe18..3cfba0e527 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -29,10 +29,10 @@ static unsigned int pci_encode_bdf(libxl_device_pci *pci)
 {
     unsigned int value;
 
-    value = pci->domain << 16;
-    value |= (pci->bus & 0xff) << 8;
-    value |= (pci->dev & 0x1f) << 3;
-    value |= (pci->func & 0x7);
+    value = pci->bdf.domain << 16;
+    value |= (pci->bdf.bus & 0xff) << 8;
+    value |= (pci->bdf.dev & 0x1f) << 3;
+    value |= (pci->bdf.func & 0x7);
 
     return value;
 }
@@ -41,10 +41,10 @@ static void pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
                             unsigned int bus, unsigned int dev,
                             unsigned int func, unsigned int vdevfn)
 {
-    pci->domain = domain;
-    pci->bus = bus;
-    pci->dev = dev;
-    pci->func = func;
+    pci->bdf.domain = domain;
+    pci->bdf.bus = bus;
+    pci->bdf.dev = dev;
+    pci->bdf.func = func;
     pci->vdevfn = vdevfn;
 }
 
@@ -54,9 +54,9 @@ static void libxl_create_pci_backend_device(libxl__gc *gc,
                                             const libxl_device_pci *pci)
 {
     flexarray_append(back, GCSPRINTF("key-%d", num));
-    flexarray_append(back, GCSPRINTF(PCI_BDF, pci->domain, pci->bus, pci->dev, pci->func));
+    flexarray_append(back, GCSPRINTF(PCI_BDF, pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func));
     flexarray_append(back, GCSPRINTF("dev-%d", num));
-    flexarray_append(back, GCSPRINTF(PCI_BDF, pci->domain, pci->bus, pci->dev, pci->func));
+    flexarray_append(back, GCSPRINTF(PCI_BDF, pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func));
     if (pci->vdevfn)
         flexarray_append_pair(back, GCSPRINTF("vdevfn-%d", num), GCSPRINTF("%x", pci->vdevfn));
     flexarray_append(back, GCSPRINTF("opts-%d", num));
@@ -250,8 +250,8 @@ static int libxl__device_pci_remove_xenstore(libxl__gc *gc, uint32_t domid, libx
         unsigned int domain = 0, bus = 0, dev = 0, func = 0;
         xsdev = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/dev-%d", be_path, i));
         sscanf(xsdev, PCI_BDF, &domain, &bus, &dev, &func);
-        if (domain == pci->domain && bus == pci->bus &&
-            pci->dev == dev && pci->func == func) {
+        if (domain == pci->bdf.domain && bus == pci->bdf.bus &&
+            pci->bdf.dev == dev && pci->bdf.func == func) {
             break;
         }
     }
@@ -362,8 +362,8 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
         return ERROR_FAIL;
     }
 
-    buf = GCSPRINTF(PCI_BDF, pci->domain, pci->bus,
-                    pci->dev, pci->func);
+    buf = GCSPRINTF(PCI_BDF, pci->bdf.domain, pci->bdf.bus,
+                    pci->bdf.dev, pci->bdf.func);
     rc = write(fd, buf, strlen(buf));
     /* Annoying to have two if's, but we need the errno */
     if (rc < 0)
@@ -383,10 +383,10 @@ static char *pci_info_xs_path(libxl__gc *gc, libxl_device_pci *pci,
 {
     return node ?
         GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH"/%s",
-                  pci->domain, pci->bus, pci->dev, pci->func,
+                  pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
                   node) :
         GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH,
-                  pci->domain, pci->bus, pci->dev, pci->func);
+                  pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
 }
 
 
@@ -484,10 +484,10 @@ static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
     struct stat st;
 
     spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/driver",
-                           pci->domain,
-                           pci->bus,
-                           pci->dev,
-                           pci->func);
+                           pci->bdf.domain,
+                           pci->bdf.bus,
+                           pci->bdf.dev,
+                           pci->bdf.func);
     if ( !lstat(spath, &st) ) {
         /* Find the canonical path to the driver. */
         dp = libxl__zalloc(gc, PATH_MAX);
@@ -517,7 +517,7 @@ static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pci)
 {
     char *pci_device_vendor_path =
             GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/vendor",
-                      pci->domain, pci->bus, pci->dev, pci->func);
+                      pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     uint16_t read_items;
     uint16_t pci_device_vendor;
 
@@ -525,7 +525,7 @@ static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pci)
     if (!f) {
         LOGE(ERROR,
              "pci device "PCI_BDF" does not have vendor attribute",
-             pci->domain, pci->bus, pci->dev, pci->func);
+             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         return 0xffff;
     }
     read_items = fscanf(f, "0x%hx\n", &pci_device_vendor);
@@ -533,7 +533,7 @@ static uint16_t sysfs_dev_get_vendor(libxl__gc *gc, libxl_device_pci *pci)
     if (read_items != 1) {
         LOGE(ERROR,
              "cannot read vendor of pci device "PCI_BDF,
-             pci->domain, pci->bus, pci->dev, pci->func);
+             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         return 0xffff;
     }
 
@@ -544,7 +544,7 @@ static uint16_t sysfs_dev_get_device(libxl__gc *gc, libxl_device_pci *pci)
 {
     char *pci_device_device_path =
             GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/device",
-                      pci->domain, pci->bus, pci->dev, pci->func);
+                      pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     uint16_t read_items;
     uint16_t pci_device_device;
 
@@ -552,7 +552,7 @@ static uint16_t sysfs_dev_get_device(libxl__gc *gc, libxl_device_pci *pci)
     if (!f) {
         LOGE(ERROR,
              "pci device "PCI_BDF" does not have device attribute",
-             pci->domain, pci->bus, pci->dev, pci->func);
+             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         return 0xffff;
     }
     read_items = fscanf(f, "0x%hx\n", &pci_device_device);
@@ -560,7 +560,7 @@ static uint16_t sysfs_dev_get_device(libxl__gc *gc, libxl_device_pci *pci)
     if (read_items != 1) {
         LOGE(ERROR,
              "cannot read device of pci device "PCI_BDF,
-             pci->domain, pci->bus, pci->dev, pci->func);
+             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         return 0xffff;
     }
 
@@ -571,14 +571,14 @@ static int sysfs_dev_get_class(libxl__gc *gc, libxl_device_pci *pci,
                                unsigned long *class)
 {
     char *pci_device_class_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/class",
-                     pci->domain, pci->bus, pci->dev, pci->func);
+                     pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     int read_items, ret = 0;
 
     FILE *f = fopen(pci_device_class_path, "r");
     if (!f) {
         LOGE(ERROR,
              "pci device "PCI_BDF" does not have class attribute",
-             pci->domain, pci->bus, pci->dev, pci->func);
+             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         ret = ERROR_FAIL;
         goto out;
     }
@@ -587,7 +587,7 @@ static int sysfs_dev_get_class(libxl__gc *gc, libxl_device_pci *pci,
     if (read_items != 1) {
         LOGE(ERROR,
              "cannot read class of pci device "PCI_BDF,
-             pci->domain, pci->bus, pci->dev, pci->func);
+             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         ret = ERROR_FAIL;
     }
 
@@ -654,10 +654,10 @@ static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
     }
 
     while (fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func)==4) {
-        if (dom == pci->domain
-            && bus == pci->bus
-            && dev == pci->dev
-            && func == pci->func) {
+        if (dom == pci->bdf.domain
+            && bus == pci->bdf.bus
+            && dev == pci->bdf.dev
+            && func == pci->bdf.func) {
             rc = 1;
             goto out;
         }
@@ -683,8 +683,8 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
     }
 
     spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
-                      pci->domain, pci->bus,
-                      pci->dev, pci->func);
+                      pci->bdf.domain, pci->bdf.bus,
+                      pci->bdf.dev, pci->bdf.func);
     rc = lstat(spath, &st);
 
     if( rc == 0 )
@@ -747,10 +747,10 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     struct stat st;
 
     /* Local copy for convenience */
-    dom = pci->domain;
-    bus = pci->bus;
-    dev = pci->dev;
-    func = pci->func;
+    dom = pci->bdf.domain;
+    bus = pci->bdf.bus;
+    dev = pci->bdf.dev;
+    func = pci->bdf.func;
 
     /* See if the device exists */
     spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
@@ -824,8 +824,8 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     /* De-quarantine */
     rc = xc_deassign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci));
     if ( rc < 0 ) {
-        LOG(ERROR, "failed to de-quarantine "PCI_BDF, pci->domain, pci->bus,
-            pci->dev, pci->func);
+        LOG(ERROR, "failed to de-quarantine "PCI_BDF, pci->bdf.domain, pci->bdf.bus,
+            pci->bdf.dev, pci->bdf.func);
         return ERROR_FAIL;
     }
 
@@ -914,11 +914,11 @@ static int pci_multifunction_check(libxl__gc *gc, libxl_device_pci *pci, unsigne
 
         if ( sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4 )
             continue;
-        if ( pci->domain != dom )
+        if ( pci->bdf.domain != dom )
             continue;
-        if ( pci->bus != bus )
+        if ( pci->bdf.bus != bus )
             continue;
-        if ( pci->dev != dev )
+        if ( pci->bdf.dev != dev )
             continue;
 
         path = GCSPRINTF("%s/" PCI_BDF, SYSFS_PCIBACK_DRIVER, dom, bus, dev, func);
@@ -967,13 +967,13 @@ static int qemu_pci_add_xenstore(libxl__gc *gc, uint32_t domid,
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/parameter");
     if (pci->vdevfn) {
         libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF_VDEVFN","PCI_OPTIONS,
-                         pci->domain, pci->bus, pci->dev,
-                         pci->func, pci->vdevfn, pci->msitranslate,
+                         pci->bdf.domain, pci->bdf.bus, pci->bdf.dev,
+                         pci->bdf.func, pci->vdevfn, pci->msitranslate,
                          pci->power_mgmt);
     } else {
         libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF","PCI_OPTIONS,
-                         pci->domain,  pci->bus, pci->dev,
-                         pci->func, pci->msitranslate, pci->power_mgmt);
+                         pci->bdf.domain,  pci->bdf.bus, pci->bdf.dev,
+                         pci->bdf.func, pci->msitranslate, pci->power_mgmt);
     }
 
     libxl__qemu_traditional_cmd(gc, domid, "pci-ins");
@@ -1132,10 +1132,10 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
     libxl__qmp_param_add_string(gc, &args, "driver",
                                 "xen-pci-passthrough");
     QMP_PARAMETERS_SPRINTF(&args, "id", PCI_PT_QDEV_ID,
-                           pci->bus, pci->dev, pci->func);
+                           pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     QMP_PARAMETERS_SPRINTF(&args, "hostaddr",
-                           "%04x:%02x:%02x.%01x", pci->domain,
-                           pci->bus, pci->dev, pci->func);
+                           "%04x:%02x:%02x.%01x", pci->bdf.domain,
+                           pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     if (pci->vdevfn) {
         QMP_PARAMETERS_SPRINTF(&args, "addr", "%x.%x",
                                PCI_SLOT(pci->vdevfn),
@@ -1223,7 +1223,7 @@ static void pci_add_qmp_query_pci_cb(libxl__egc *egc,
      */
 
     asked_id = GCSPRINTF(PCI_PT_QDEV_ID,
-                         pci->bus, pci->dev, pci->func);
+                         pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
 
     for (i = 0; (bus = libxl__json_array_get(response, i)); i++) {
         devices = libxl__json_map_get("devices", bus, JSON_ARRAY);
@@ -1314,8 +1314,8 @@ static void pci_add_dm_done(libxl__egc *egc,
     if (isstubdom)
         starting = false;
 
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
-                           pci->bus, pci->dev, pci->func);
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->bdf.domain,
+                           pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     f = fopen(sysfs_path, "r");
     start = end = flags = size = 0;
     irq = 0;
@@ -1355,8 +1355,8 @@ static void pci_add_dm_done(libxl__egc *egc,
         }
     }
     fclose(f);
-    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
-                                pci->bus, pci->dev, pci->func);
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->bdf.domain,
+                                pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
         LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
@@ -1527,7 +1527,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         if (rc) {
             LOGD(ERROR, domid,
                  "PCI device %04x:%02x:%02x.%u %s?",
-                 pci->domain, pci->bus, pci->dev, pci->func,
+                 pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
                  errno == EOPNOTSUPP ? "cannot be assigned - no IOMMU"
                  : "already assigned to a different guest");
             goto out;
@@ -1545,7 +1545,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
 
     if (!libxl_pci_assignable(ctx, pci)) {
         LOGD(ERROR, domid, "PCI device %x:%x:%x.%x is not assignable",
-             pci->domain, pci->bus, pci->dev, pci->func);
+             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         rc = ERROR_FAIL;
         goto out;
     }
@@ -1553,7 +1553,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     rc = pci_info_xs_write(gc, pci, "domid", GCSPRINTF("%u", domid));
     if (rc) goto out;
 
-    libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
+    libxl__device_pci_reset(gc, pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
     if (stubdomid != 0) {
@@ -1634,13 +1634,13 @@ static void device_pci_add_stubdom_done(libxl__egc *egc,
         pci->vfunc_mask &= pfunc_mask;
         /* so now vfunc_mask == pfunc_mask */
     }else{
-        pfunc_mask = (1 << pci->func);
+        pfunc_mask = (1 << pci->bdf.func);
     }
 
     for (rc = 0, i = 7; i >= 0; --i) {
         if ( (1 << i) & pfunc_mask ) {
             if ( pci->vfunc_mask == pfunc_mask ) {
-                pci->func = i;
+                pci->bdf.func = i;
                 pci->vdevfn = orig_vdev | i;
             } else {
                 /* if not passing through multiple devices in a block make
@@ -1672,7 +1672,7 @@ static void device_pci_add_done(libxl__egc *egc,
         LOGD(ERROR, domid,
              "libxl__device_pci_add  failed for "
              "PCI device %x:%x:%x.%x (rc %d)",
-             pci->domain, pci->bus, pci->dev, pci->func,
+             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
              rc);
         pci_info_xs_remove(gc, pci, "domid");
     }
@@ -1741,8 +1741,8 @@ static int qemu_pci_remove_xenstore(libxl__gc *gc, uint32_t domid,
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
     state = libxl__xs_read(gc, XBT_NULL, path);
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/parameter");
-    libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF, pci->domain,
-                     pci->bus, pci->dev, pci->func);
+    libxl__xs_printf(gc, XBT_NULL, path, PCI_BDF, pci->bdf.domain,
+                     pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
 
     /* Remove all functions at once atomically by only signalling
      * device-model for function 0 */
@@ -1856,8 +1856,8 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
     } else {
         assert(type == LIBXL_DOMAIN_TYPE_PV);
 
-        char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
-                                     pci->bus, pci->dev, pci->func);
+        char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->bdf.domain,
+                                     pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         FILE *f = fopen(sysfs_path, "r");
         unsigned int start = 0, end = 0, flags = 0, size = 0;
         int irq = 0;
@@ -1892,8 +1892,8 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
         }
         fclose(f);
 skip1:
-        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
-                               pci->bus, pci->dev, pci->func);
+        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->bdf.domain,
+                               pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         f = fopen(sysfs_path, "r");
         if (f == NULL) {
             LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
@@ -1957,7 +1957,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
     if (rc) goto out;
 
     QMP_PARAMETERS_SPRINTF(&args, "id", PCI_PT_QDEV_ID,
-                           pci->bus, pci->dev, pci->func);
+                           pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     prs->qmp.callback = pci_remove_qmp_device_del_cb;
     rc = libxl__ev_qmp_send(egc, &prs->qmp, "device_del", args);
     if (rc) goto out;
@@ -2026,7 +2026,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
     libxl__ev_qmp_dispose(gc, qmp);
 
     asked_id = GCSPRINTF(PCI_PT_QDEV_ID,
-                         pci->bus, pci->dev, pci->func);
+                         pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
 
     /* query-pci response:
      * [{ 'devices': [ 'qdev_id': 'str', ...  ], ... }]
@@ -2077,7 +2077,7 @@ static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
     libxl_device_pci *const pci = &prs->pci;
 
     LOGD(WARN, prs->domid, "timed out waiting for DM to remove "
-         PCI_PT_QDEV_ID, pci->bus, pci->dev, pci->func);
+         PCI_PT_QDEV_ID, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
 
     /* If we timed out, we might still want to keep destroying the device
      * (when force==true), so let the next function decide what to do on
@@ -2110,7 +2110,7 @@ static void pci_remove_detached(libxl__egc *egc,
 
     /* don't do multiple resets while some functions are still passed through */
     if ((pci->vdevfn & 0x7) == 0) {
-        libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
+        libxl__device_pci_reset(gc, pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
     }
 
     if (!isstubdom) {
@@ -2198,7 +2198,7 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
         }
         pci->vfunc_mask &= prs->pfunc_mask;
     } else {
-        prs->pfunc_mask = (1 << pci->func);
+        prs->pfunc_mask = (1 << pci->bdf.func);
     }
 
     rc = 0;
@@ -2226,7 +2226,7 @@ static void device_pci_remove_common_next(libxl__egc *egc,
         prs->next_func--;
         if ( (1 << i) & pfunc_mask ) {
             if ( pci->vfunc_mask == pfunc_mask ) {
-                pci->func = i;
+                pci->bdf.func = i;
                 pci->vdevfn = orig_vdev | i;
             } else {
                 pci->vdevfn = orig_vdev;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 20f8dd7cfa..2c441142fb 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -769,18 +769,22 @@ libxl_device_nic = Struct("device_nic", [
     ("colo_checkpoint_port", string)
     ])
 
+libxl_pci_bdf = Struct("pci_bdf", [
+    ("func", uint8),
+    ("dev", uint8),
+    ("bus", uint8),
+    ("domain", integer),
+    ])
+
 libxl_device_pci = Struct("device_pci", [
-    ("func",      uint8),
-    ("dev",       uint8),
-    ("bus",       uint8),
-    ("domain",    integer),
-    ("vdevfn",    uint32),
+    ("bdf", libxl_pci_bdf),
+    ("vdevfn", uint32),
     ("vfunc_mask", uint32),
     ("msitranslate", bool),
     ("power_mgmt", bool),
     ("permissive", bool),
     ("seize", bool),
-    ("rdm_policy",      libxl_rdm_reserve_policy),
+    ("rdm_policy", libxl_rdm_reserve_policy),
     ])
 
 libxl_device_rdm = Struct("device_rdm", [
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index 1d38fffce3..5c107f2642 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -27,10 +27,10 @@ static int pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
                            unsigned int bus, unsigned int dev,
                            unsigned int func, unsigned int vdevfn)
 {
-    pci->domain = domain;
-    pci->bus = bus;
-    pci->dev = dev;
-    pci->func = func;
+    pci->bdf.domain = domain;
+    pci->bdf.bus = bus;
+    pci->bdf.dev = dev;
+    pci->bdf.func = func;
     pci->vdevfn = vdevfn;
     return 0;
 }
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index f71498cbb5..b6dc7c2840 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -34,7 +34,8 @@ static void pcilist(uint32_t domid)
     for (i = 0; i < num; i++) {
         printf("%02x.%01x %04x:%02x:%02x.%01x\n",
                (pcis[i].vdevfn >> 3) & 0x1f, pcis[i].vdevfn & 0x7,
-               pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
+               pcis[i].bdf.domain, pcis[i].bdf.bus, pcis[i].bdf.dev,
+               pcis[i].bdf.func);
     }
     libxl_device_pci_list_free(pcis, num);
 }
@@ -163,7 +164,8 @@ static void pciassignable_list(void)
         return;
     for (i = 0; i < num; i++) {
         printf("%04x:%02x:%02x.%01x\n",
-               pcis[i].domain, pcis[i].bus, pcis[i].dev, pcis[i].func);
+               pcis[i].bdf.domain, pcis[i].bdf.bus, pcis[i].bdf.dev,
+               pcis[i].bdf.func);
     }
     libxl_device_pci_assignable_list_free(pcis, num);
 }
diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
index b03e348ffb..95180b60df 100644
--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -194,8 +194,8 @@ void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
         fprintf(fh, "\t(device\n");
         fprintf(fh, "\t\t(pci\n");
         fprintf(fh, "\t\t\t(pci dev %04x:%02x:%02x.%01x@%02x)\n",
-               d_config->pcis[i].domain, d_config->pcis[i].bus,
-               d_config->pcis[i].dev, d_config->pcis[i].func,
+               d_config->pcis[i].bdf.domain, d_config->pcis[i].bdf.bus,
+               d_config->pcis[i].bdf.dev, d_config->pcis[i].bdf.func,
                d_config->pcis[i].vdevfn);
         fprintf(fh, "\t\t\t(opts msitranslate %d power_mgmt %d)\n",
                d_config->pcis[i].msitranslate,
-- 
2.11.0


