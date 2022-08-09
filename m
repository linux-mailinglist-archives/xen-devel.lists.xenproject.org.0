Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB4E58D33D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 07:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382687.617700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtM-0006V3-CF; Tue, 09 Aug 2022 05:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382687.617700; Tue, 09 Aug 2022 05:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtM-0006Ra-90; Tue, 09 Aug 2022 05:35:00 +0000
Received: by outflank-mailman (input) for mailman id 382687;
 Tue, 09 Aug 2022 05:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IoV=YN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oLHtK-0006BY-Kn
 for xen-devel@lists.xen.org; Tue, 09 Aug 2022 05:34:59 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff386983-17a4-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 07:34:55 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so11239431pjl.0
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 22:34:55 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 pf2-20020a17090b1d8200b001f7613a9d0dsm2442940pjb.52.2022.08.08.22.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 22:34:52 -0700 (PDT)
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
X-Inumbo-ID: ff386983-17a4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=yuZwz8uc5wN8Cuv0zx5mBsmVFoUbz2odV0n16zvvUWs=;
        b=OrwZ0wLjzdCU5gHXJoz0aXkTOIjCrFikIslFlY4X2Y9QSqHUoSyrGC8Gd5q6Z11eqz
         1S67aVZLnGWIlNlrOq0bOPn5sb6ct3+jZymdz81W7Dces4e7a28pfGVHxslHcOXJqsB8
         CtWBoV2a91RZSq4NvIHjFtHxelh+fMUutnf+KCOgYfBWVDgwjyNmzCKt/N6LxhoSVJsn
         o7HxbGCbZLn0Y3AGixtcP0FCQkUXh3UOBODD8c9tMjzT+I//KpEBGWli9+Z0RF8AB5tA
         javIVQ+ymlXgovNS0P9WCzA4PJeVB+fgxqaPMcuAg2HLMwmEo8Z/DkQrS7Ey0HBPd1+b
         JwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=yuZwz8uc5wN8Cuv0zx5mBsmVFoUbz2odV0n16zvvUWs=;
        b=SOubzgxLbQu2uLGGnSWstezgndvnVlu2jn8O+zDC3INVXlp0JKPb66pew00lstpJKY
         CqtYoWBBcqZAo0XCgj2EyROwEfE3L4mu3kLG7Lehvqr+yhUGbqXLf5cLpf/UKU8/pVgg
         gLKjr09CWCkzbjvqLc1mRqC9FdhdxwPWrgMMaJvYL9E8XAJBZT3Sf+Fo3v3FW1InUIY/
         lGs2QF4ISyaFOwxc3zktJmm5h5ppIT7aFfq1DxdXpWqXF3Gx8KB9EufjH4/boFbcecRr
         BXiWBUS+ATcmIRaSM9l905w2s6yyRqeosOsjjBMKIw0LjNsR2rRv441DbA2dLjMgAVwh
         bb/Q==
X-Gm-Message-State: ACgBeo3p/kFEw7e3ztAvjSnWdU2sQvbewX6SHLbMokGxLjdvL9a5Bw09
	DKxaK4R83zvx8kSOVHKFh0G52QW+tLP9FQ==
X-Google-Smtp-Source: AA6agR7oft/k0xWNBdGy2GKOt/ulmF37hRbGg5HQccdn0lTDV4hoKqnlNGCAJ004qypEuY+oXIDRrQ==
X-Received: by 2002:a17:902:dace:b0:170:8c21:3b1f with SMTP id q14-20020a170902dace00b001708c213b1fmr14309873plx.55.1660023293467;
        Mon, 08 Aug 2022 22:34:53 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V4 1/6] libxl: Add support for Virtio I2C device
Date: Tue,  9 Aug 2022 11:04:28 +0530
Message-Id: <6cd6ca9d72d4f844e8a007b687e28f49301fae03.1660023094.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1660023094.git.viresh.kumar@linaro.org>
References: <cover.1660023094.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for configuring and assisting virtio-mmio
based virtio-i2c backend (emualator) which is intended to run out of
Qemu and could be run in any domain.

An example of domain configuration for Virtio I2c:
i2c = [ "" ]

Please note, this patch is not enough for virtio-i2c to work on Xen
(Arm), as for every Virtio device we need to allocate Virtio MMIO params
(IRQ and memory region) and pass them to the backend, also update Guest
device-tree. A subsequent patch will add these missing bits. For the
current patch, the default "irq" and "base" are just written to the
Xenstore.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/golang/xenlight/helpers.gen.go      | 108 +++++++++++
 tools/golang/xenlight/types.gen.go        |  27 +++
 tools/include/libxl.h                     |  32 +++
 tools/include/libxl_utils.h               |   3 +
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_create.c           |  13 ++
 tools/libs/light/libxl_dm.c               |  19 +-
 tools/libs/light/libxl_i2c.c              | 226 ++++++++++++++++++++++
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  24 +++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/ocaml/libs/xl/genwrap.py            |   1 +
 tools/ocaml/libs/xl/xenlight_stubs.c      |   1 +
 tools/xl/Makefile                         |   2 +-
 tools/xl/xl.h                             |   3 +
 tools/xl/xl_cmdtable.c                    |  15 ++
 tools/xl/xl_i2c.c                         | 142 ++++++++++++++
 tools/xl/xl_parse.c                       |  80 ++++++++
 tools/xl/xl_parse.h                       |   1 +
 tools/xl/xl_sxp.c                         |   2 +
 20 files changed, 699 insertions(+), 3 deletions(-)
 create mode 100644 tools/libs/light/libxl_i2c.c
 create mode 100644 tools/xl/xl_i2c.c

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index fa3cf2ab7658..4c7b60439bf0 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1221,6 +1221,9 @@ x.Usbdevice = C.GoString(tmp.usbdevice)
 if err := x.VkbDevice.fromC(&tmp.vkb_device);err != nil {
 return fmt.Errorf("converting field VkbDevice: %v", err)
 }
+if err := x.I2cDevice.fromC(&tmp.i2c_device);err != nil {
+return fmt.Errorf("converting field I2cDevice: %v", err)
+}
 x.Soundhw = C.GoString(tmp.soundhw)
 if err := x.XenPlatformPci.fromC(&tmp.xen_platform_pci);err != nil {
 return fmt.Errorf("converting field XenPlatformPci: %v", err)
@@ -1538,6 +1541,9 @@ hvm.usbdevice = C.CString(tmp.Usbdevice)}
 if err := tmp.VkbDevice.toC(&hvm.vkb_device); err != nil {
 return fmt.Errorf("converting field VkbDevice: %v", err)
 }
+if err := tmp.I2cDevice.toC(&hvm.i2c_device); err != nil {
+return fmt.Errorf("converting field I2cDevice: %v", err)
+}
 if tmp.Soundhw != "" {
 hvm.soundhw = C.CString(tmp.Soundhw)}
 if err := tmp.XenPlatformPci.toC(&hvm.xen_platform_pci); err != nil {
@@ -1734,6 +1740,46 @@ xc.multi_touch_num_contacts = C.uint32_t(x.MultiTouchNumContacts)
  return nil
  }
 
+// NewDeviceI2c returns an instance of DeviceI2c initialized with defaults.
+func NewDeviceI2c() (*DeviceI2c, error) {
+var (
+x DeviceI2c
+xc C.libxl_device_i2c)
+
+C.libxl_device_i2c_init(&xc)
+defer C.libxl_device_i2c_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *DeviceI2c) fromC(xc *C.libxl_device_i2c) error {
+ x.BackendDomid = Domid(xc.backend_domid)
+x.BackendDomname = C.GoString(xc.backend_domname)
+x.Devid = Devid(xc.devid)
+x.BackendType = I2cBackend(xc.backend_type)
+x.Irq = uint32(xc.irq)
+x.Base = uint64(xc.base)
+
+ return nil}
+
+func (x *DeviceI2c) toC(xc *C.libxl_device_i2c) (err error){defer func(){
+if err != nil{
+C.libxl_device_i2c_dispose(xc)}
+}()
+
+xc.backend_domid = C.libxl_domid(x.BackendDomid)
+if x.BackendDomname != "" {
+xc.backend_domname = C.CString(x.BackendDomname)}
+xc.devid = C.libxl_devid(x.Devid)
+xc.backend_type = C.libxl_i2c_backend(x.BackendType)
+xc.irq = C.uint32_t(x.Irq)
+xc.base = C.uint64_t(x.Base)
+
+ return nil
+ }
+
 // NewDeviceDisk returns an instance of DeviceDisk initialized with defaults.
 func NewDeviceDisk() (*DeviceDisk, error) {
 var (
@@ -2867,6 +2913,15 @@ if err := x.Vkbs[i].fromC(&v); err != nil {
 return fmt.Errorf("converting field Vkbs: %v", err) }
 }
 }
+x.I2cs = nil
+if n := int(xc.num_i2cs); n > 0 {
+cI2cs := (*[1<<28]C.libxl_device_i2c)(unsafe.Pointer(xc.i2cs))[:n:n]
+x.I2cs = make([]DeviceI2c, n)
+for i, v := range cI2cs {
+if err := x.I2cs[i].fromC(&v); err != nil {
+return fmt.Errorf("converting field I2cs: %v", err) }
+}
+}
 x.Vtpms = nil
 if n := int(xc.num_vtpms); n > 0 {
 cVtpms := (*[1<<28]C.libxl_device_vtpm)(unsafe.Pointer(xc.vtpms))[:n:n]
@@ -3028,6 +3083,16 @@ return fmt.Errorf("converting field Vkbs: %v", err)
 }
 }
 }
+if numI2cs := len(x.I2cs); numI2cs > 0 {
+xc.i2cs = (*C.libxl_device_i2c)(C.malloc(C.ulong(numI2cs)*C.sizeof_libxl_device_i2c))
+xc.num_i2cs = C.int(numI2cs)
+cI2cs := (*[1<<28]C.libxl_device_i2c)(unsafe.Pointer(xc.i2cs))[:numI2cs:numI2cs]
+for i,v := range x.I2cs {
+if err := v.toC(&cI2cs[i]); err != nil {
+return fmt.Errorf("converting field I2cs: %v", err)
+}
+}
+}
 if numVtpms := len(x.Vtpms); numVtpms > 0 {
 xc.vtpms = (*C.libxl_device_vtpm)(C.malloc(C.ulong(numVtpms)*C.sizeof_libxl_device_vtpm))
 xc.num_vtpms = C.int(numVtpms)
@@ -3733,6 +3798,49 @@ xc.rref = C.int(x.Rref)
  return nil
  }
 
+// NewI2cinfo returns an instance of I2cinfo initialized with defaults.
+func NewI2cinfo() (*I2cinfo, error) {
+var (
+x I2cinfo
+xc C.libxl_i2cinfo)
+
+C.libxl_i2cinfo_init(&xc)
+defer C.libxl_i2cinfo_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *I2cinfo) fromC(xc *C.libxl_i2cinfo) error {
+ x.Backend = C.GoString(xc.backend)
+x.BackendId = uint32(xc.backend_id)
+x.Frontend = C.GoString(xc.frontend)
+x.FrontendId = uint32(xc.frontend_id)
+x.Devid = Devid(xc.devid)
+x.State = int(xc.state)
+x.Evtch = int(xc.evtch)
+x.Rref = int(xc.rref)
+
+ return nil}
+
+func (x *I2cinfo) toC(xc *C.libxl_i2cinfo) (err error){defer func(){
+if err != nil{
+C.libxl_i2cinfo_dispose(xc)}
+}()
+
+if x.Backend != "" {
+xc.backend = C.CString(x.Backend)}
+xc.backend_id = C.uint32_t(x.BackendId)
+if x.Frontend != "" {
+xc.frontend = C.CString(x.Frontend)}
+xc.frontend_id = C.uint32_t(x.FrontendId)
+xc.devid = C.libxl_devid(x.Devid)
+xc.state = C.int(x.State)
+
+ return nil
+ }
+
 // NewNumainfo returns an instance of Numainfo initialized with defaults.
 func NewNumainfo() (*Numainfo, error) {
 var (
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a0be7ada8c63..f8d7e84d6180 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -255,6 +255,11 @@ VkbBackendQemu VkbBackend = 1
 VkbBackendLinux VkbBackend = 2
 )
 
+type I2cBackend int
+const(
+I2cBackendVirtio I2cBackend = 0
+)
+
 type Passthrough int
 const(
 PassthroughDefault Passthrough = 0
@@ -584,6 +589,7 @@ Usb Defbool
 Usbversion int
 Usbdevice string
 VkbDevice Defbool
+I2cDevice Defbool
 Soundhw string
 XenPlatformPci Defbool
 UsbdeviceList StringList
@@ -646,6 +652,15 @@ MultiTouchHeight uint32
 MultiTouchNumContacts uint32
 }
 
+type DeviceI2c struct {
+BackendDomid Domid
+BackendDomname string
+Devid Devid
+BackendType I2cBackend
+Irq uint32
+Base uint64
+}
+
 type DeviceDisk struct {
 BackendDomid Domid
 BackendDomname string
@@ -935,6 +950,7 @@ Rdms []DeviceRdm
 Dtdevs []DeviceDtdev
 Vfbs []DeviceVfb
 Vkbs []DeviceVkb
+I2cs []DeviceI2c
 Vtpms []DeviceVtpm
 P9S []DeviceP9
 Pvcallsifs []DevicePvcallsif
@@ -1091,6 +1107,17 @@ Evtch int
 Rref int
 }
 
+type I2cinfo struct {
+Backend string
+BackendId uint32
+Frontend string
+FrontendId uint32
+Devid Devid
+State int
+Evtch int
+Rref int
+}
+
 type Numainfo struct {
 Size uint64
 Free uint64
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2321a648a59a..ab18c0b8c794 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -829,6 +829,15 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_BUILDINFO_VKB_DEVICE 1
 
+/*
+ * LIBXL_HAVE_BUILDINFO_I2C_DEVICE
+ *
+ * If this is defined, then the libxl_domain_build_info structure will
+ * contain a boolean hvm.i2c_device which instructs libxl whether to include
+ * a i2c at build time or not.
+ */
+#define LIBXL_HAVE_BUILDINFO_I2C_DEVICE 1
+
 /*
  * LIBXL_HAVE_BUILDINFO_USBDEVICE_LIST
  *
@@ -2397,6 +2406,29 @@ int libxl_device_vkb_getinfo(libxl_ctx *ctx, uint32_t domid,
                              libxl_vkbinfo *vkbinfo)
                              LIBXL_EXTERNAL_CALLERS_ONLY;
 
+/* I2C */
+int libxl_device_i2c_add(libxl_ctx *ctx, uint32_t domid, libxl_device_i2c *i2c,
+                         const libxl_asyncop_how *ao_how)
+                         LIBXL_EXTERNAL_CALLERS_ONLY;
+int libxl_device_i2c_remove(libxl_ctx *ctx, uint32_t domid,
+                            libxl_device_i2c *i2c,
+                            const libxl_asyncop_how *ao_how)
+                            LIBXL_EXTERNAL_CALLERS_ONLY;
+int libxl_device_i2c_destroy(libxl_ctx *ctx, uint32_t domid,
+                             libxl_device_i2c *i2c,
+                             const libxl_asyncop_how *ao_how)
+                            LIBXL_EXTERNAL_CALLERS_ONLY;
+
+libxl_device_i2c *libxl_device_i2c_list(libxl_ctx *ctx,
+                                        uint32_t domid, int *num)
+                                        LIBXL_EXTERNAL_CALLERS_ONLY;
+void libxl_device_i2c_list_free(libxl_device_i2c* list, int num)
+                                LIBXL_EXTERNAL_CALLERS_ONLY;
+int libxl_device_i2c_getinfo(libxl_ctx *ctx, uint32_t domid,
+                             const libxl_device_i2c *i2c,
+                             libxl_i2cinfo *i2cinfo)
+                             LIBXL_EXTERNAL_CALLERS_ONLY;
+
 /* Framebuffer */
 int libxl_device_vfb_add(libxl_ctx *ctx, uint32_t domid, libxl_device_vfb *vfb,
                          const libxl_asyncop_how *ao_how)
diff --git a/tools/include/libxl_utils.h b/tools/include/libxl_utils.h
index 46918aea847f..72b7796b7e4b 100644
--- a/tools/include/libxl_utils.h
+++ b/tools/include/libxl_utils.h
@@ -83,6 +83,9 @@ int libxl_devid_to_device_usbctrl(libxl_ctx *ctx, uint32_t domid,
 int libxl_devid_to_device_vkb(libxl_ctx *ctx, uint32_t domid,
                               int devid, libxl_device_vkb *vkb);
 
+int libxl_devid_to_device_i2c(libxl_ctx *ctx, uint32_t domid,
+                              int devid, libxl_device_i2c *i2c);
+
 int libxl_devid_to_device_vdispl(libxl_ctx *ctx, uint32_t domid,
                                  int devid, libxl_device_vdispl *vdispl);
 
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 13545654c2fc..961bdd33297b 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -112,6 +112,7 @@ OBJS-y += libxl_vdispl.o
 OBJS-y += libxl_pvcalls.o
 OBJS-y += libxl_vsnd.o
 OBJS-y += libxl_vkb.o
+OBJS-y += libxl_i2c.o
 OBJS-y += libxl_genid.o
 OBJS-y += _libxl_types.o
 OBJS-y += libxl_flask.o
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index b9dd2deedf13..84fe9f80c8fe 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -375,6 +375,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->u.hvm.altp2m,             false);
         libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
         libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
+        libxl_defbool_setdefault(&b_info->u.hvm.i2c_device,         true);
         libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
 
         libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
@@ -1753,6 +1754,7 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
         libxl__device_console console;
         libxl__device device;
         libxl_device_vkb vkb;
+        libxl_device_i2c i2c;
 
         init_console_info(gc, &console, 0);
         console.backend_domid = state->console_domid;
@@ -1765,6 +1767,12 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
             libxl_device_vkb_dispose(&vkb);
         }
 
+        if (libxl_defbool_val(d_config->b_info.u.hvm.i2c_device)) {
+            libxl_device_i2c_init(&i2c);
+            libxl__device_add(gc, domid, &libxl__i2c_devtype, &i2c);
+            libxl_device_i2c_dispose(&i2c);
+        }
+
         dcs->sdss.dm.guest_domid = domid;
         if (libxl_defbool_val(d_config->b_info.device_model_stubdomain))
             libxl__spawn_stub_dm(egc, &dcs->sdss);
@@ -1797,6 +1805,11 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
                               &d_config->vkbs[i]);
         }
 
+        for (i = 0; i < d_config->num_i2cs; i++) {
+            libxl__device_add(gc, domid, &libxl__i2c_devtype,
+                              &d_config->i2cs[i]);
+        }
+
         if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
             init_console_info(gc, &vuart, 0);
             vuart.backend_domid = state->console_domid;
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 1864ee30f0a2..9340ae4628a2 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2095,7 +2095,8 @@ static void libxl__dm_vifs_from_hvm_guest_config(libxl__gc *gc,
 static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
                                         const libxl_domain_config *guest_config,
                                         libxl_device_vfb *vfb,
-                                        libxl_device_vkb *vkb)
+                                        libxl_device_vkb *vkb,
+                                        libxl_device_i2c *i2c)
 {
     const libxl_domain_build_info *b_info = &guest_config->b_info;
 
@@ -2104,6 +2105,7 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
 
     libxl_device_vfb_init(vfb);
     libxl_device_vkb_init(vkb);
+    libxl_device_i2c_init(i2c);
 
     vfb->backend_domid = 0;
     vfb->devid = 0;
@@ -2114,6 +2116,9 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
     vkb->backend_domid = 0;
     vkb->devid = 0;
 
+    i2c->backend_domid = 0;
+    i2c->devid = 0;
+
     return 0;
 }
 
@@ -2276,6 +2281,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
     int ret;
     libxl_device_vfb *vfb;
     libxl_device_vkb *vkb;
+    libxl_device_i2c *i2c;
     char **args;
     struct xs_permissions perm[2];
     xs_transaction_t t;
@@ -2348,11 +2354,14 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
         || libxl_defbool_val(guest_config->b_info.u.hvm.sdl.enable)) {
         GCNEW(vfb);
         GCNEW(vkb);
-        libxl__vfb_and_vkb_from_hvm_guest_config(gc, guest_config, vfb, vkb);
+        GCNEW(i2c);
+        libxl__vfb_and_vkb_from_hvm_guest_config(gc, guest_config, vfb, vkb, i2c);
         dm_config->vfbs = vfb;
         dm_config->num_vfbs = 1;
         dm_config->vkbs = vkb;
         dm_config->num_vkbs = 1;
+        dm_config->i2cs = i2c;
+        dm_config->num_i2cs = 1;
     }
 
     if (guest_config->b_info.stubdomain_kernel &&
@@ -2494,6 +2503,12 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
         if (ret) goto out;
     }
 
+    if (dm_config->num_i2cs) {
+        ret = libxl__device_add(gc, dm_domid, &libxl__i2c_devtype,
+                                &dm_config->i2cs[0]);
+        if (ret) goto out;
+    }
+
     if (guest_config->b_info.u.hvm.serial) {
         num_console++;
     } else if (guest_config->b_info.u.hvm.serial_list) {
diff --git a/tools/libs/light/libxl_i2c.c b/tools/libs/light/libxl_i2c.c
new file mode 100644
index 000000000000..2c46351ce3a4
--- /dev/null
+++ b/tools/libs/light/libxl_i2c.c
@@ -0,0 +1,226 @@
+/*
+ * Copyright (C) 2022 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include "libxl_internal.h"
+
+static int libxl__device_i2c_setdefault(libxl__gc *gc, uint32_t domid,
+                                        libxl_device_i2c *i2c, bool hotplug)
+{
+    if (i2c->backend_type != LIBXL_I2C_BACKEND_VIRTIO) {
+        i2c->backend_type = LIBXL_I2C_BACKEND_VIRTIO;
+    }
+
+    return libxl__resolve_domid(gc, i2c->backend_domname, &i2c->backend_domid);
+}
+
+static int libxl__device_i2c_dm_needed(void *e, uint32_t domid)
+{
+    libxl_device_i2c *elem = e;
+
+    return elem->backend_type == LIBXL_I2C_BACKEND_VIRTIO;
+}
+
+static int libxl__set_xenstore_i2c(libxl__gc *gc, uint32_t domid,
+                                   libxl_device_i2c *i2c,
+                                   flexarray_t *back, flexarray_t *front,
+                                   flexarray_t *ro_front)
+{
+    flexarray_append_pair(back, "irq", GCSPRINTF("%u", i2c->irq));
+    flexarray_append_pair(back, "base", GCSPRINTF("%lu", i2c->base));
+
+    flexarray_append_pair(front, "irq", GCSPRINTF("%u", i2c->irq));
+    flexarray_append_pair(front, "base", GCSPRINTF("%lu", i2c->base));
+
+    return 0;
+}
+
+static int libxl__i2c_from_xenstore(libxl__gc *gc, const char *libxl_path,
+                                    libxl_devid devid,
+                                    libxl_device_i2c *i2c)
+{
+    const char *be_path, *fe_path, *tmp;
+    libxl__device dev;
+    int rc;
+
+    i2c->devid = devid;
+
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("%s/backend", libxl_path),
+                                  &be_path);
+    if (rc) goto out;
+
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("%s/frontend", libxl_path),
+                                  &fe_path);
+    if (rc) goto out;
+
+    rc = libxl__backendpath_parse_domid(gc, be_path, &i2c->backend_domid);
+    if (rc) goto out;
+
+    rc = libxl__parse_backend_path(gc, be_path, &dev);
+    if (rc) goto out;
+
+    i2c->backend_type = LIBXL_I2C_BACKEND_VIRTIO;
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/irq", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        i2c->irq = strtoul(tmp, NULL, 0);
+    }
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/base", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        i2c->base = strtoul(tmp, NULL, 0);
+    }
+
+    rc = 0;
+
+out:
+
+    return rc;
+}
+
+static int libxl__device_from_i2c(libxl__gc *gc, uint32_t domid,
+                                  libxl_device_i2c *type, libxl__device *device)
+{
+    device->backend_devid   = type->devid;
+    device->backend_domid   = type->backend_domid;
+    device->backend_kind    = LIBXL__DEVICE_KIND_I2C;
+    device->devid           = type->devid;
+    device->domid           = domid;
+    device->kind            = LIBXL__DEVICE_KIND_I2C;
+
+    return 0;
+}
+
+int libxl_device_i2c_add(libxl_ctx *ctx, uint32_t domid, libxl_device_i2c *i2c,
+                         const libxl_asyncop_how *ao_how)
+{
+    AO_CREATE(ctx, domid, ao_how);
+    int rc;
+
+    rc = libxl__device_add(gc, domid, &libxl__i2c_devtype, i2c);
+    if (rc) {
+        LOGD(ERROR, domid, "Unable to add i2c device");
+        goto out;
+    }
+
+out:
+    libxl__ao_complete(egc, ao, rc);
+    return AO_INPROGRESS;
+}
+
+int libxl_devid_to_device_i2c(libxl_ctx *ctx, uint32_t domid,
+                              int devid, libxl_device_i2c *i2c)
+{
+    GC_INIT(ctx);
+
+    libxl_device_i2c *i2cs = NULL;
+    int n, i;
+    int rc;
+
+    libxl_device_i2c_init(i2c);
+
+    i2cs = libxl__device_list(gc, &libxl__i2c_devtype, domid, &n);
+
+    if (!i2cs) { rc = ERROR_NOTFOUND; goto out; }
+
+    for (i = 0; i < n; ++i) {
+        if (devid == i2cs[i].devid) {
+            libxl_device_i2c_copy(ctx, i2c, &i2cs[i]);
+            rc = 0;
+            goto out;
+        }
+    }
+
+    rc = ERROR_NOTFOUND;
+
+out:
+
+    if (i2cs)
+        libxl__device_list_free(&libxl__i2c_devtype, i2cs, n);
+
+    GC_FREE;
+    return rc;
+}
+
+int libxl_device_i2c_getinfo(libxl_ctx *ctx, uint32_t domid,
+                             const libxl_device_i2c *i2c,
+                             libxl_i2cinfo *info)
+{
+    GC_INIT(ctx);
+    char *libxl_path, *dompath, *devpath;
+    char *val;
+    int rc;
+
+    libxl_i2cinfo_init(info);
+    dompath = libxl__xs_get_dompath(gc, domid);
+    info->devid = i2c->devid;
+
+    devpath = libxl__domain_device_frontend_path(gc, domid, info->devid,
+                                                 LIBXL__DEVICE_KIND_I2C);
+    libxl_path = libxl__domain_device_libxl_path(gc, domid, info->devid,
+                                                 LIBXL__DEVICE_KIND_I2C);
+
+    info->backend = xs_read(ctx->xsh, XBT_NULL,
+                            GCSPRINTF("%s/backend", libxl_path),
+                            NULL);
+    if (!info->backend) { rc = ERROR_FAIL; goto out; }
+
+    rc = libxl__backendpath_parse_domid(gc, info->backend, &info->backend_id);
+    if (rc) goto out;
+
+    val = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/state", devpath));
+    info->state = val ? strtoul(val, NULL, 10) : -1;
+
+    info->frontend = xs_read(ctx->xsh, XBT_NULL,
+                             GCSPRINTF("%s/frontend", libxl_path),
+                             NULL);
+    info->frontend_id = domid;
+
+    rc = 0;
+
+out:
+     GC_FREE;
+     return rc;
+}
+
+static LIBXL_DEFINE_UPDATE_DEVID(i2c)
+
+#define libxl__add_i2cs NULL
+#define libxl_device_i2c_compare NULL
+
+LIBXL_DEFINE_DEVICE_LIST(i2c)
+LIBXL_DEFINE_DEVICE_REMOVE(i2c)
+
+DEFINE_DEVICE_TYPE_STRUCT(i2c, I2C, i2cs,
+    .skip_attach = 1,
+    .dm_needed = libxl__device_i2c_dm_needed,
+    .set_xenstore_config = (device_set_xenstore_config_fn_t)
+                           libxl__set_xenstore_i2c,
+    .from_xenstore = (device_from_xenstore_fn_t)libxl__i2c_from_xenstore
+);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index cb9e8b3b8b5a..a8904cfea427 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4003,6 +4003,7 @@ static inline int *libxl__device_type_get_num(
 
 extern const libxl__device_type libxl__vfb_devtype;
 extern const libxl__device_type libxl__vkb_devtype;
+extern const libxl__device_type libxl__i2c_devtype;
 extern const libxl__device_type libxl__disk_devtype;
 extern const libxl__device_type libxl__nic_devtype;
 extern const libxl__device_type libxl__vtpm_devtype;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d634f304cda2..014a3ea8364c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -278,6 +278,10 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
     (2, "LINUX")
     ])
 
+libxl_i2c_backend = Enumeration("i2c_backend", [
+    (0, "VIRTIO")
+    ])
+
 libxl_passthrough = Enumeration("passthrough", [
     (0, "default"),
     (1, "disabled"),
@@ -626,6 +630,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                        # - "mouse" for PS/2 protocol relative mouse
                                        ("usbdevice",        string),
                                        ("vkb_device",       libxl_defbool),
+                                       ("i2c_device",       libxl_defbool),
                                        ("soundhw",          string),
                                        ("xen_platform_pci", libxl_defbool),
                                        ("usbdevice_list",   libxl_string_list),
@@ -705,6 +710,15 @@ libxl_device_vkb = Struct("device_vkb", [
     ("multi_touch_num_contacts", uint32)
     ])
 
+libxl_device_i2c = Struct("device_i2c", [
+    ("backend_domid", libxl_domid),
+    ("backend_domname", string),
+    ("devid", libxl_devid),
+    ("backend_type", libxl_i2c_backend),
+    ("irq", uint32),
+    ("base", uint64)
+    ])
+
 libxl_device_disk = Struct("device_disk", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -982,6 +996,7 @@ libxl_domain_config = Struct("domain_config", [
     ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
     ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
     ("vkbs", Array(libxl_device_vkb, "num_vkbs")),
+    ("i2cs", Array(libxl_device_i2c, "num_i2cs")),
     ("vtpms", Array(libxl_device_vtpm, "num_vtpms")),
     ("p9s", Array(libxl_device_p9, "num_p9s")),
     ("pvcallsifs", Array(libxl_device_pvcallsif, "num_pvcallsifs")),
@@ -1145,6 +1160,15 @@ libxl_vkbinfo = Struct("vkbinfo", [
     ("rref", integer)
     ], dir=DIR_OUT)
 
+libxl_i2cinfo = Struct("i2cinfo", [
+    ("backend", string),
+    ("backend_id", uint32),
+    ("frontend", string),
+    ("frontend_id", uint32),
+    ("devid", libxl_devid),
+    ("state", integer),
+    ], dir=DIR_OUT)
+
 # NUMA node characteristics: size and free are how much memory it has, and how
 # much of it is free, respectively. dists is an array of distances from this
 # node to each other node.
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index 8f71980aecf1..1d83c600aaaf 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -33,6 +33,7 @@ libxl__device_kind = Enumeration("device_kind", [
     (15, "VSND"),
     (16, "VINPUT"),
     (17, "VIRTIO_DISK"),
+    (18, "I2C"),
     ])
 
 libxl__console_backend = Enumeration("console_backend", [
diff --git a/tools/ocaml/libs/xl/genwrap.py b/tools/ocaml/libs/xl/genwrap.py
index 7bf26bdcd831..a9db0b97d80f 100644
--- a/tools/ocaml/libs/xl/genwrap.py
+++ b/tools/ocaml/libs/xl/genwrap.py
@@ -36,6 +36,7 @@ DEVICE_LIST =      [ ("list",           ["ctx", "domid", "t list"]),
 functions = { # ( name , [type1,type2,....] )
     "device_vfb":     DEVICE_FUNCTIONS,
     "device_vkb":     DEVICE_FUNCTIONS,
+    "device_i2c":     DEVICE_FUNCTIONS,
     "device_disk":    DEVICE_FUNCTIONS + DEVICE_LIST +
                       [ ("insert",         ["ctx", "t", "domid", "?async:'a", "unit", "unit"]),
                         ("of_vdev",        ["ctx", "domid", "string", "t"]),
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 45b8af61c74a..cdf473f4ed57 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -707,6 +707,7 @@ DEVICE_ADDREMOVE(disk)
 DEVICE_ADDREMOVE(nic)
 DEVICE_ADDREMOVE(vfb)
 DEVICE_ADDREMOVE(vkb)
+DEVICE_ADDREMOVE(i2c)
 DEVICE_ADDREMOVE(pci)
 _DEVICE_ADDREMOVE(disk, cdrom, insert)
 
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index b7f439121a3a..06801962f11e 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -23,7 +23,7 @@ XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
 XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
 XL_OBJS += xl_info.o xl_console.o xl_misc.o
 XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
-XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
+XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o xl_i2c.o
 
 $(XL_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(XL_OBJS): CFLAGS += $(CFLAGS_XL)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7c9aff6ad7a6..28618326149e 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -176,6 +176,9 @@ int main_vsnddetach(int argc, char **argv);
 int main_vkbattach(int argc, char **argv);
 int main_vkblist(int argc, char **argv);
 int main_vkbdetach(int argc, char **argv);
+int main_i2cattach(int argc, char **argv);
+int main_i2clist(int argc, char **argv);
+int main_i2cdetach(int argc, char **argv);
 int main_usbctrl_attach(int argc, char **argv);
 int main_usbctrl_detach(int argc, char **argv);
 int main_usbdev_attach(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 35182ca19630..c409ab1578d4 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -406,6 +406,21 @@ const struct cmd_spec cmd_table[] = {
       "Destroy a domain's virtual keyboard device",
       "<Domain> <DevId>",
     },
+    { "i2c-attach",
+      &main_i2cattach, 1, 1,
+      "Create a new virtual i2c device",
+      "<Domain> <i2c-spec-component(s)>...",
+    },
+    { "i2c-list",
+      &main_i2clist, 0, 0,
+      "List virtual i2c devices for a domain",
+      "<Domain(s)>",
+    },
+    { "i2c-detach",
+      &main_i2cdetach, 0, 1,
+      "Destroy a domain's virtual i2c device",
+      "<Domain> <DevId>",
+    },
     { "vdispl-attach",
       &main_vdisplattach, 1, 1,
       "Create a new virtual display device",
diff --git a/tools/xl/xl_i2c.c b/tools/xl/xl_i2c.c
new file mode 100644
index 000000000000..463fac2d5836
--- /dev/null
+++ b/tools/xl/xl_i2c.c
@@ -0,0 +1,142 @@
+/*
+ * Copyright (C) 2022 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include <stdlib.h>
+
+#include <libxl.h>
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include "xl.h"
+#include "xl_utils.h"
+#include "xl_parse.h"
+
+int main_i2cattach(int argc, char **argv)
+{
+    int opt;
+    int rc;
+    uint32_t domid;
+    libxl_device_i2c i2c;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "i2c-attach", 2) {
+        /* No options */
+    }
+
+    libxl_device_i2c_init(&i2c);
+    domid = find_domain(argv[optind++]);
+
+    for (argv += optind, argc -= optind; argc > 0; ++argv, --argc) {
+        rc = parse_i2c_config(&i2c, *argv);
+        if (rc) goto out;
+    }
+
+    if (dryrun_only) {
+        char *json = libxl_device_i2c_to_json(ctx, &i2c);
+        printf("i2c: %s\n", json);
+        free(json);
+        goto done;
+    }
+
+    if (libxl_device_i2c_add(ctx, domid, &i2c, 0)) {
+        fprintf(stderr, "libxl_device_i2c_add failed.\n");
+        rc = ERROR_FAIL; goto out;
+    }
+
+done:
+    rc = 0;
+
+out:
+    libxl_device_i2c_dispose(&i2c);
+    return rc;
+}
+
+int main_i2clist(int argc, char **argv)
+{
+    int opt;
+    libxl_device_i2c *i2cs;
+    libxl_i2cinfo i2cinfo;
+    int nb, i;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "i2c-list", 1) {
+        /* No options */
+    }
+
+    /*      Idx  BE   Hdl  Sta  evch ref ID    BE-type BE-path */
+    printf("%-3s %-2s %-6s %-5s %-6s %6s %-10s %-10s %-30s\n",
+           "Idx", "BE", "handle", "state", "evt-ch", "ref",
+           "ID", "BE-type", "BE-path");
+    for (argv += optind, argc -= optind; argc > 0; --argc, ++argv) {
+        uint32_t domid = find_domain(*argv);
+        i2cs = libxl_device_i2c_list(ctx, domid, &nb);
+        if (!i2cs) {
+            continue;
+        }
+        for (i = 0; i < nb; ++i) {
+            if (libxl_device_i2c_getinfo(ctx, domid, &i2cs[i], &i2cinfo) == 0) {
+                printf("%-3d %-2d %6d %5d %-10s %-30s\n",
+                       i2cinfo.devid, i2cinfo.backend_id,
+                       i2cinfo.devid, i2cinfo.state,
+                       libxl_i2c_backend_to_string(i2cs[i].backend_type),
+                       i2cinfo.backend);
+                libxl_i2cinfo_dispose(&i2cinfo);
+            }
+        }
+        libxl_device_i2c_list_free(i2cs, nb);
+    }
+    return 0;
+}
+
+int main_i2cdetach(int argc, char **argv)
+{
+    uint32_t domid, devid;
+    int opt, rc;
+    libxl_device_i2c i2c;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "i2c-detach", 2) {
+        /* No options */
+    }
+
+    domid = find_domain(argv[optind++]);
+    devid = atoi(argv[optind++]);
+
+    libxl_device_i2c_init(&i2c);
+
+    if (libxl_devid_to_device_i2c(ctx, domid, devid, &i2c)) {
+        fprintf(stderr, "Error: Device %d not connected.\n", devid);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    rc = libxl_device_i2c_remove(ctx, domid, &i2c, 0);
+    if (rc) {
+        fprintf(stderr, "libxl_device_i2c_remove failed.\n");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    rc = 0;
+
+out:
+    libxl_device_i2c_dispose(&i2c);
+    return rc;
+}
+
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1b5381cef033..b91ffba14d40 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1208,6 +1208,74 @@ static void parse_vkb_list(const XLU_Config *config,
     if (rc) exit(EXIT_FAILURE);
 }
 
+int parse_i2c_config(libxl_device_i2c *i2c, char *token)
+{
+    char *oparg;
+
+    if (MATCH_OPTION("backend", token, oparg)) {
+        i2c->backend_domname = strdup(oparg);
+    } else if (MATCH_OPTION("backend-type", token, oparg)) {
+        libxl_i2c_backend backend_type;
+        if (libxl_i2c_backend_from_string(oparg, &backend_type)) {
+            fprintf(stderr, "Unknown backend_type \"%s\" in i2c spec\n",
+                            oparg);
+            return -1;
+        }
+        i2c->backend_type = backend_type;
+    } else if (MATCH_OPTION("irq", token, oparg)) {
+        i2c->irq = strtoul(oparg, NULL, 0);
+    } else if (MATCH_OPTION("base", token, oparg)) {
+        i2c->base = strtoul(oparg, NULL, 0);
+    } else {
+        fprintf(stderr, "Unknown string \"%s\" in i2c spec\n", token);
+        return -1;
+    }
+
+    return 0;
+}
+
+static void parse_i2c_list(const XLU_Config *config,
+                           libxl_domain_config *d_config)
+{
+    XLU_ConfigList *i2cs;
+    const char *item;
+    char *buf = NULL;
+    int rc;
+
+    if (!xlu_cfg_get_list (config, "i2c", &i2cs, 0, 0)) {
+        int entry = 0;
+        while ((item = xlu_cfg_get_listitem(i2cs, entry)) != NULL) {
+            libxl_device_i2c *i2c;
+            char *p;
+
+            i2c = ARRAY_EXTEND_INIT(d_config->i2cs,
+                                    d_config->num_i2cs,
+                                    libxl_device_i2c_init);
+
+            buf = strdup(item);
+
+            p = strtok (buf, ",");
+            while (p != NULL)
+            {
+                while (*p == ' ') p++;
+
+                rc = parse_i2c_config(i2c, p);
+                if (rc) goto out;
+
+                p = strtok (NULL, ",");
+            }
+
+            entry++;
+        }
+    }
+
+    rc = 0;
+
+out:
+    free(buf);
+    if (rc) exit(EXIT_FAILURE);
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2309,13 +2377,16 @@ void parse_config_data(const char *config_source,
 
     d_config->num_vfbs = 0;
     d_config->num_vkbs = 0;
+    d_config->num_i2cs = 0;
     d_config->vfbs = NULL;
     d_config->vkbs = NULL;
+    d_config->i2cs = NULL;
 
     if (!xlu_cfg_get_list (config, "vfb", &cvfbs, 0, 0)) {
         while ((buf = xlu_cfg_get_listitem (cvfbs, d_config->num_vfbs)) != NULL) {
             libxl_device_vfb *vfb;
             libxl_device_vkb *vkb;
+            libxl_device_i2c *i2c;
 
             char *buf2 = strdup(buf);
             char *p, *p2;
@@ -2326,6 +2397,9 @@ void parse_config_data(const char *config_source,
             vkb = ARRAY_EXTEND_INIT(d_config->vkbs, d_config->num_vkbs,
                                     libxl_device_vkb_init);
 
+            i2c = ARRAY_EXTEND_INIT(d_config->i2cs, d_config->num_i2cs,
+                                    libxl_device_i2c_init);
+
             p = strtok(buf2, ",");
             if (!p)
                 goto skip_vfb;
@@ -2583,6 +2657,7 @@ void parse_config_data(const char *config_source,
         if (vnc_enabled) {
             libxl_device_vfb *vfb;
             libxl_device_vkb *vkb;
+            libxl_device_i2c *i2c;
 
             vfb = ARRAY_EXTEND_INIT(d_config->vfbs, d_config->num_vfbs,
                                     libxl_device_vfb_init);
@@ -2590,6 +2665,9 @@ void parse_config_data(const char *config_source,
             vkb = ARRAY_EXTEND_INIT(d_config->vkbs, d_config->num_vkbs,
                                     libxl_device_vkb_init);
 
+            i2c = ARRAY_EXTEND_INIT(d_config->i2cs, d_config->num_i2cs,
+                                    libxl_device_i2c_init);
+
             parse_top_level_vnc_options(config, &vfb->vnc);
             parse_top_level_sdl_options(config, &vfb->sdl);
             xlu_cfg_replace_string (config, "keymap", &vfb->keymap, 0);
@@ -2704,6 +2782,7 @@ void parse_config_data(const char *config_source,
             exit(-ERROR_FAIL);
         }
         xlu_cfg_get_defbool(config, "vkb_device", &b_info->u.hvm.vkb_device, 0);
+        xlu_cfg_get_defbool(config, "i2c_device", &b_info->u.hvm.i2c_device, 0);
         xlu_cfg_replace_string (config, "soundhw", &b_info->u.hvm.soundhw, 0);
         xlu_cfg_get_defbool(config, "xen_platform_pci",
                             &b_info->u.hvm.xen_platform_pci, 0);
@@ -2752,6 +2831,7 @@ void parse_config_data(const char *config_source,
     }
 
     parse_vkb_list(config, d_config);
+    parse_i2c_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
diff --git a/tools/xl/xl_parse.h b/tools/xl/xl_parse.h
index bab2861f8c3e..4b972d525199 100644
--- a/tools/xl/xl_parse.h
+++ b/tools/xl/xl_parse.h
@@ -36,6 +36,7 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token);
 int parse_vdispl_config(libxl_device_vdispl *vdispl, char *token);
 int parse_vsnd_item(libxl_device_vsnd *vsnd, const char *spec);
 int parse_vkb_config(libxl_device_vkb *vkb, char *token);
+int parse_i2c_config(libxl_device_i2c *i2c, char *token);
 
 int match_option_size(const char *prefix, size_t len,
                       char *arg, char **argopt);
diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
index 359a0015709e..a44c765aa515 100644
--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -140,6 +140,8 @@ void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
         fprintf(fh, "\t\t\t(usbdevice %s)\n", b_info->u.hvm.usbdevice);
         fprintf(fh, "\t\t\t(vkb_device %s)\n",
                libxl_defbool_to_string(b_info->u.hvm.vkb_device));
+        fprintf(fh, "\t\t\t(i2c_device %s)\n",
+               libxl_defbool_to_string(b_info->u.hvm.i2c_device));
         fprintf(fh, "\t\t)\n");
         break;
     case LIBXL_DOMAIN_TYPE_PV:
-- 
2.31.1.272.g89b43f80a514


