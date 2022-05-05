Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3DF51B92D
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321561.542595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVza-0007s7-8d; Thu, 05 May 2022 07:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321561.542595; Thu, 05 May 2022 07:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVza-0007oW-57; Thu, 05 May 2022 07:33:42 +0000
Received: by outflank-mailman (input) for mailman id 321561;
 Thu, 05 May 2022 07:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7gz=VN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1nmVzY-0007CX-3i
 for xen-devel@lists.xen.org; Thu, 05 May 2022 07:33:40 +0000
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acf234c8-cc45-11ec-a406-831a346695d4;
 Thu, 05 May 2022 09:33:37 +0200 (CEST)
Received: by mail-pg1-x535.google.com with SMTP id x12so3023843pgj.7
 for <xen-devel@lists.xen.org>; Thu, 05 May 2022 00:33:37 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 x24-20020a170902b41800b0015e8d4eb1e4sm779323plr.46.2022.05.05.00.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 00:33:35 -0700 (PDT)
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
X-Inumbo-ID: acf234c8-cc45-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HyzuOp/tvITGfFX9GJge8V/26LSsI0eF8GbficmNu7U=;
        b=pyGfDoyLFuWl7Uj8utxqcCHZVXxkdcVJBD4N8YyjBhRZD/9RiFZsjcRaDN6M1nPy+g
         Ftpz5n12CQZe/4QBDji+hcO3FxoH90fYRVZIjphl1WdjQDWKEVTRugn+oIi6vv1go0x2
         ygPM0lqcuLjOYIGBqEd5dBmwoGhIrwb01WIUkvCDnYzdLSV3vqOz3SsBqfGvDNjM2h8P
         BQwyVIySeue2vG2UkJr5vC9aKEfirHWcDcHrq8NGSOZryfZt9jwE1l9iymwTfS56oUR4
         YFMgWoOOwXp5ZMF2KlsSvLgRg3zh10RWaL9j1JnmCxHcGmCn/uMvYLFu1+C+wjNFWrB7
         Mfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HyzuOp/tvITGfFX9GJge8V/26LSsI0eF8GbficmNu7U=;
        b=OlSpsQHvmAZOFjy0kRFZiqduWyD1AuTw2+HsEJeW5whjMnoefbBuGzymBXkxXQXKfO
         sYBrXaX5K6q4LIENbTUy4rsFQS+TSPFv9y48mx5uaDLsO7CXbF+2+nhlHhRy28gvDbJo
         O283rwhkz3X6al1LBWUUKBRa1f2XDACXuf+evVAUpJUzIuCXy5BtAEXGY2Shia0lDVkB
         O3gPWysEuI3pTJRgQHGCc0kHp7+wMt3AU9FIoNuLuyXrE1wwjeoDN2XR41zWFpkSaux2
         0LdG6ODl8k5CNL9OaiBdQJR/FA7yrgRY7gpUfrrebxD5LkeZzpUrNWKdrzbyFR70iz3X
         gXyA==
X-Gm-Message-State: AOAM5309zCGEz3m1VpwigD2/dHC2jRSjkrEsodM0myIKpS+fFsOFZhLT
	Nmi/YH2DHXw7BEJmBcWQyTWanj8fUZkSrQ==
X-Google-Smtp-Source: ABdhPJy24n+voUOot2k8vkUuG3nP609OSqbhbHtF4yaWeeHu10U3e83/J+rrHenK+BqGmK52eVHafw==
X-Received: by 2002:a05:6a00:c8f:b0:510:60cf:55fa with SMTP id a15-20020a056a000c8f00b0051060cf55famr1662695pfv.37.1651736016099;
        Thu, 05 May 2022 00:33:36 -0700 (PDT)
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
Subject: [PATCH 2/4] libxl: Add support for Virtio GPIO device
Date: Thu,  5 May 2022 13:03:21 +0530
Message-Id: <ff6b649efe5a98cb2a24d663041fdd2d51a3712d.1651734854.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1651734854.git.viresh.kumar@linaro.org>
References: <cover.1651734854.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for configuring and assisting virtio-mmio
based virtio-gpio backend (emualator) which is intended to run out of
Qemu and could be run in any domain.

An example of domain configuration for Virtio Gpio:
gpio = [ "" ]

Please note, this patch is not enough for virtio-gpio to work on Xen
(Arm), as for every Virtio device we need to allocate Virtio MMIO params
(IRQ and memory region) and pass them to the backend, also update Guest
device-tree. A subsequent patch will add these missing bits. For the
current patch, the default "irq" and "base" are just written to the
Xenstore.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/golang/xenlight/helpers.gen.go      | 110 ++++++++++
 tools/golang/xenlight/types.gen.go        |  27 +++
 tools/include/libxl.h                     |  32 +++
 tools/include/libxl_utils.h               |   3 +
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_create.c           |  13 ++
 tools/libs/light/libxl_dm.c               |  17 +-
 tools/libs/light/libxl_gpio.c             | 236 ++++++++++++++++++++++
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  26 +++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/ocaml/libs/xl/genwrap.py            |   1 +
 tools/ocaml/libs/xl/xenlight_stubs.c      |   1 +
 tools/xl/Makefile                         |   2 +-
 tools/xl/xl.h                             |   3 +
 tools/xl/xl_cmdtable.c                    |  15 ++
 tools/xl/xl_gpio.c                        | 143 +++++++++++++
 tools/xl/xl_parse.c                       |  80 ++++++++
 tools/xl/xl_parse.h                       |   1 +
 tools/xl/xl_sxp.c                         |   2 +
 20 files changed, 713 insertions(+), 2 deletions(-)
 create mode 100644 tools/libs/light/libxl_gpio.c
 create mode 100644 tools/xl/xl_gpio.c

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index ad23b0969abd..ed880cad3fa7 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1215,6 +1215,9 @@ x.Usbdevice = C.GoString(tmp.usbdevice)
 if err := x.VkbDevice.fromC(&tmp.vkb_device);err != nil {
 return fmt.Errorf("converting field VkbDevice: %v", err)
 }
+if err := x.GpioDevice.fromC(&tmp.gpio_device);err != nil {
+return fmt.Errorf("converting field GpioDevice: %v", err)
+}
 if err := x.I2cDevice.fromC(&tmp.i2c_device);err != nil {
 return fmt.Errorf("converting field I2cDevice: %v", err)
 }
@@ -1535,6 +1538,9 @@ hvm.usbdevice = C.CString(tmp.Usbdevice)}
 if err := tmp.VkbDevice.toC(&hvm.vkb_device); err != nil {
 return fmt.Errorf("converting field VkbDevice: %v", err)
 }
+if err := tmp.GpioDevice.toC(&hvm.gpio_device); err != nil {
+return fmt.Errorf("converting field GpioDevice: %v", err)
+}
 if err := tmp.I2cDevice.toC(&hvm.i2c_device); err != nil {
 return fmt.Errorf("converting field I2cDevice: %v", err)
 }
@@ -1728,6 +1734,46 @@ xc.multi_touch_num_contacts = C.uint32_t(x.MultiTouchNumContacts)
  return nil
  }
 
+// NewDeviceGpio returns an instance of DeviceGpio initialized with defaults.
+func NewDeviceGpio() (*DeviceGpio, error) {
+var (
+x DeviceGpio
+xc C.libxl_device_gpio)
+
+C.libxl_device_gpio_init(&xc)
+defer C.libxl_device_gpio_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *DeviceGpio) fromC(xc *C.libxl_device_gpio) error {
+ x.BackendDomid = Domid(xc.backend_domid)
+x.BackendDomname = C.GoString(xc.backend_domname)
+x.Devid = Devid(xc.devid)
+x.BackendType = GpioBackend(xc.backend_type)
+x.Irq = uint32(xc.irq)
+x.Base = uint64(xc.base)
+
+ return nil}
+
+func (x *DeviceGpio) toC(xc *C.libxl_device_gpio) (err error){defer func(){
+if err != nil{
+C.libxl_device_gpio_dispose(xc)}
+}()
+
+xc.backend_domid = C.libxl_domid(x.BackendDomid)
+if x.BackendDomname != "" {
+xc.backend_domname = C.CString(x.BackendDomname)}
+xc.devid = C.libxl_devid(x.Devid)
+xc.backend_type = C.libxl_gpio_backend(x.BackendType)
+xc.irq = C.uint32_t(x.Irq)
+xc.base = C.uint64_t(x.Base)
+
+ return nil
+ }
+
 // NewDeviceI2c returns an instance of DeviceI2c initialized with defaults.
 func NewDeviceI2c() (*DeviceI2c, error) {
 var (
@@ -2881,6 +2927,15 @@ if err := x.Vkbs[i].fromC(&v); err != nil {
 return fmt.Errorf("converting field Vkbs: %v", err) }
 }
 }
+x.Gpios = nil
+if n := int(xc.num_gpios); n > 0 {
+cGpios := (*[1<<28]C.libxl_device_gpio)(unsafe.Pointer(xc.gpios))[:n:n]
+x.Gpios = make([]DeviceGpio, n)
+for i, v := range cGpios {
+if err := x.Gpios[i].fromC(&v); err != nil {
+return fmt.Errorf("converting field Gpios: %v", err) }
+}
+}
 x.I2cs = nil
 if n := int(xc.num_i2cs); n > 0 {
 cI2cs := (*[1<<28]C.libxl_device_i2c)(unsafe.Pointer(xc.i2cs))[:n:n]
@@ -3051,6 +3106,16 @@ return fmt.Errorf("converting field Vkbs: %v", err)
 }
 }
 }
+if numGpios := len(x.Gpios); numGpios > 0 {
+xc.gpios = (*C.libxl_device_gpio)(C.malloc(C.ulong(numGpios)*C.sizeof_libxl_device_gpio))
+xc.num_gpios = C.int(numGpios)
+cGpios := (*[1<<28]C.libxl_device_gpio)(unsafe.Pointer(xc.gpios))[:numGpios:numGpios]
+for i,v := range x.Gpios {
+if err := v.toC(&cGpios[i]); err != nil {
+return fmt.Errorf("converting field Gpios: %v", err)
+}
+}
+}
 if numI2cs := len(x.I2cs); numI2cs > 0 {
 xc.i2cs = (*C.libxl_device_i2c)(C.malloc(C.ulong(numI2cs)*C.sizeof_libxl_device_i2c))
 xc.num_i2cs = C.int(numI2cs)
@@ -3748,6 +3813,51 @@ if err != nil{
 C.libxl_vkbinfo_dispose(xc)}
 }()
 
+if x.Backend != "" {
+xc.backend = C.CString(x.Backend)}
+xc.backend_id = C.uint32_t(x.BackendId)
+if x.Frontend != "" {
+xc.frontend = C.CString(x.Frontend)}
+xc.frontend_id = C.uint32_t(x.FrontendId)
+xc.devid = C.libxl_devid(x.Devid)
+xc.state = C.int(x.State)
+xc.evtch = C.int(x.Evtch)
+xc.rref = C.int(x.Rref)
+
+ return nil
+ }
+
+// NewGpioinfo returns an instance of Gpioinfo initialized with defaults.
+func NewGpioinfo() (*Gpioinfo, error) {
+var (
+x Gpioinfo
+xc C.libxl_gpioinfo)
+
+C.libxl_gpioinfo_init(&xc)
+defer C.libxl_gpioinfo_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *Gpioinfo) fromC(xc *C.libxl_gpioinfo) error {
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
+func (x *Gpioinfo) toC(xc *C.libxl_gpioinfo) (err error){defer func(){
+if err != nil{
+C.libxl_gpioinfo_dispose(xc)}
+}()
+
 if x.Backend != "" {
 xc.backend = C.CString(x.Backend)}
 xc.backend_id = C.uint32_t(x.BackendId)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index c232e4811ac3..cb959d5fa87a 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -241,6 +241,11 @@ VkbBackendQemu VkbBackend = 1
 VkbBackendLinux VkbBackend = 2
 )
 
+type GpioBackend int
+const(
+GpioBackendVirtio GpioBackend = 0
+)
+
 type I2cBackend int
 const(
 I2cBackendVirtio I2cBackend = 0
@@ -573,6 +578,7 @@ Usb Defbool
 Usbversion int
 Usbdevice string
 VkbDevice Defbool
+GpioDevice Defbool
 I2cDevice Defbool
 Soundhw string
 XenPlatformPci Defbool
@@ -636,6 +642,15 @@ MultiTouchHeight uint32
 MultiTouchNumContacts uint32
 }
 
+type DeviceGpio struct {
+BackendDomid Domid
+BackendDomname string
+Devid Devid
+BackendType GpioBackend
+Irq uint32
+Base uint64
+}
+
 type DeviceI2c struct {
 BackendDomid Domid
 BackendDomname string
@@ -928,6 +943,7 @@ Rdms []DeviceRdm
 Dtdevs []DeviceDtdev
 Vfbs []DeviceVfb
 Vkbs []DeviceVkb
+Gpios []DeviceGpio
 I2cs []DeviceI2c
 Vtpms []DeviceVtpm
 P9S []DeviceP9
@@ -1083,6 +1099,17 @@ Evtch int
 Rref int
 }
 
+type Gpioinfo struct {
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
 type I2cinfo struct {
 Backend string
 BackendId uint32
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 4d19194c3dc2..f2fe616dee18 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -800,6 +800,15 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_BUILDINFO_VKB_DEVICE 1
 
+/*
+ * LIBXL_HAVE_BUILDINFO_GPIO_DEVICE
+ *
+ * If this is defined, then the libxl_domain_build_info structure will
+ * contain a boolean hvm.gpio_device which instructs libxl whether to include
+ * a gpio at build time or not.
+ */
+#define LIBXL_HAVE_BUILDINFO_GPIO_DEVICE 1
+
 /*
  * LIBXL_HAVE_BUILDINFO_I2C_DEVICE
  *
@@ -2377,6 +2386,29 @@ int libxl_device_vkb_getinfo(libxl_ctx *ctx, uint32_t domid,
                              libxl_vkbinfo *vkbinfo)
                              LIBXL_EXTERNAL_CALLERS_ONLY;
 
+/* GPIO */
+int libxl_device_gpio_add(libxl_ctx *ctx, uint32_t domid, libxl_device_gpio *gpio,
+                         const libxl_asyncop_how *ao_how)
+                         LIBXL_EXTERNAL_CALLERS_ONLY;
+int libxl_device_gpio_remove(libxl_ctx *ctx, uint32_t domid,
+                            libxl_device_gpio *gpio,
+                            const libxl_asyncop_how *ao_how)
+                            LIBXL_EXTERNAL_CALLERS_ONLY;
+int libxl_device_gpio_destroy(libxl_ctx *ctx, uint32_t domid,
+                             libxl_device_gpio *gpio,
+                             const libxl_asyncop_how *ao_how)
+                            LIBXL_EXTERNAL_CALLERS_ONLY;
+
+libxl_device_gpio *libxl_device_gpio_list(libxl_ctx *ctx,
+                                        uint32_t domid, int *num)
+                                        LIBXL_EXTERNAL_CALLERS_ONLY;
+void libxl_device_gpio_list_free(libxl_device_gpio* list, int num)
+                                LIBXL_EXTERNAL_CALLERS_ONLY;
+int libxl_device_gpio_getinfo(libxl_ctx *ctx, uint32_t domid,
+                             const libxl_device_gpio *gpio,
+                             libxl_gpioinfo *gpioinfo)
+                             LIBXL_EXTERNAL_CALLERS_ONLY;
+
 /* I2C */
 int libxl_device_i2c_add(libxl_ctx *ctx, uint32_t domid, libxl_device_i2c *i2c,
                          const libxl_asyncop_how *ao_how)
diff --git a/tools/include/libxl_utils.h b/tools/include/libxl_utils.h
index 72b7796b7e4b..91f5c68172cb 100644
--- a/tools/include/libxl_utils.h
+++ b/tools/include/libxl_utils.h
@@ -83,6 +83,9 @@ int libxl_devid_to_device_usbctrl(libxl_ctx *ctx, uint32_t domid,
 int libxl_devid_to_device_vkb(libxl_ctx *ctx, uint32_t domid,
                               int devid, libxl_device_vkb *vkb);
 
+int libxl_devid_to_device_gpio(libxl_ctx *ctx, uint32_t domid,
+                              int devid, libxl_device_gpio *gpio);
+
 int libxl_devid_to_device_i2c(libxl_ctx *ctx, uint32_t domid,
                               int devid, libxl_device_i2c *i2c);
 
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index dca46846e586..6caa15cc1148 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -112,6 +112,7 @@ SRCS-y += libxl_vdispl.c
 SRCS-y += libxl_pvcalls.c
 SRCS-y += libxl_vsnd.c
 SRCS-y += libxl_vkb.c
+SRCS-y += libxl_gpio.c
 SRCS-y += libxl_i2c.c
 SRCS-y += libxl_genid.c
 SRCS-y += _libxl_types.c
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index d604171e504c..836d43bd3f03 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -363,6 +363,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->u.hvm.altp2m,             false);
         libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
         libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
+        libxl_defbool_setdefault(&b_info->u.hvm.gpio_device,         true);
         libxl_defbool_setdefault(&b_info->u.hvm.i2c_device,         true);
         libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
 
@@ -1756,6 +1757,7 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
         libxl__device_console console;
         libxl__device device;
         libxl_device_vkb vkb;
+        libxl_device_gpio gpio;
         libxl_device_i2c i2c;
 
         init_console_info(gc, &console, 0);
@@ -1769,6 +1771,12 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
             libxl_device_vkb_dispose(&vkb);
         }
 
+        if (libxl_defbool_val(d_config->b_info.u.hvm.gpio_device)) {
+            libxl_device_gpio_init(&gpio);
+            libxl__device_add(gc, domid, &libxl__gpio_devtype, &gpio);
+            libxl_device_gpio_dispose(&gpio);
+        }
+
         if (libxl_defbool_val(d_config->b_info.u.hvm.i2c_device)) {
             libxl_device_i2c_init(&i2c);
             libxl__device_add(gc, domid, &libxl__i2c_devtype, &i2c);
@@ -1807,6 +1815,11 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
                               &d_config->vkbs[i]);
         }
 
+        for (i = 0; i < d_config->num_gpios; i++) {
+            libxl__device_add(gc, domid, &libxl__gpio_devtype,
+                              &d_config->gpios[i]);
+        }
+
         for (i = 0; i < d_config->num_i2cs; i++) {
             libxl__device_add(gc, domid, &libxl__i2c_devtype,
                               &d_config->i2cs[i]);
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9340ae4628a2..124b73f1dd00 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2096,6 +2096,7 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
                                         const libxl_domain_config *guest_config,
                                         libxl_device_vfb *vfb,
                                         libxl_device_vkb *vkb,
+                                        libxl_device_gpio *gpio,
                                         libxl_device_i2c *i2c)
 {
     const libxl_domain_build_info *b_info = &guest_config->b_info;
@@ -2105,6 +2106,7 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
 
     libxl_device_vfb_init(vfb);
     libxl_device_vkb_init(vkb);
+    libxl_device_gpio_init(gpio);
     libxl_device_i2c_init(i2c);
 
     vfb->backend_domid = 0;
@@ -2116,6 +2118,9 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
     vkb->backend_domid = 0;
     vkb->devid = 0;
 
+    gpio->backend_domid = 0;
+    gpio->devid = 0;
+
     i2c->backend_domid = 0;
     i2c->devid = 0;
 
@@ -2281,6 +2286,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
     int ret;
     libxl_device_vfb *vfb;
     libxl_device_vkb *vkb;
+    libxl_device_gpio *gpio;
     libxl_device_i2c *i2c;
     char **args;
     struct xs_permissions perm[2];
@@ -2354,12 +2360,15 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
         || libxl_defbool_val(guest_config->b_info.u.hvm.sdl.enable)) {
         GCNEW(vfb);
         GCNEW(vkb);
+        GCNEW(gpio);
         GCNEW(i2c);
-        libxl__vfb_and_vkb_from_hvm_guest_config(gc, guest_config, vfb, vkb, i2c);
+        libxl__vfb_and_vkb_from_hvm_guest_config(gc, guest_config, vfb, vkb, gpio, i2c);
         dm_config->vfbs = vfb;
         dm_config->num_vfbs = 1;
         dm_config->vkbs = vkb;
         dm_config->num_vkbs = 1;
+        dm_config->gpios = gpio;
+        dm_config->num_gpios = 1;
         dm_config->i2cs = i2c;
         dm_config->num_i2cs = 1;
     }
@@ -2503,6 +2512,12 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
         if (ret) goto out;
     }
 
+    if (dm_config->num_gpios) {
+        ret = libxl__device_add(gc, dm_domid, &libxl__gpio_devtype,
+                                &dm_config->gpios[0]);
+        if (ret) goto out;
+    }
+
     if (dm_config->num_i2cs) {
         ret = libxl__device_add(gc, dm_domid, &libxl__i2c_devtype,
                                 &dm_config->i2cs[0]);
diff --git a/tools/libs/light/libxl_gpio.c b/tools/libs/light/libxl_gpio.c
new file mode 100644
index 000000000000..2bf68deb3850
--- /dev/null
+++ b/tools/libs/light/libxl_gpio.c
@@ -0,0 +1,236 @@
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
+#include <xen/io/kbdif.h>
+
+static int libxl__device_gpio_setdefault(libxl__gc *gc, uint32_t domid,
+                                        libxl_device_gpio *gpio, bool hotplug)
+{
+    if (gpio->backend_type != LIBXL_GPIO_BACKEND_VIRTIO) {
+        gpio->backend_type = LIBXL_GPIO_BACKEND_VIRTIO;
+    }
+
+    return libxl__resolve_domid(gc, gpio->backend_domname, &gpio->backend_domid);
+}
+
+static int libxl__device_gpio_dm_needed(void *e, uint32_t domid)
+{
+    libxl_device_gpio *elem = e;
+
+    return elem->backend_type == LIBXL_GPIO_BACKEND_VIRTIO;
+}
+
+static int libxl__set_xenstore_gpio(libxl__gc *gc, uint32_t domid,
+                                   libxl_device_gpio *gpio,
+                                   flexarray_t *back, flexarray_t *front,
+                                   flexarray_t *ro_front)
+{
+    flexarray_append_pair(back, "irq", GCSPRINTF("%u", gpio->irq));
+    flexarray_append_pair(back, "base", GCSPRINTF("%lu", gpio->base));
+
+    flexarray_append_pair(front, "irq", GCSPRINTF("%u", gpio->irq));
+    flexarray_append_pair(front, "base", GCSPRINTF("%lu", gpio->base));
+
+    return 0;
+}
+
+static int libxl__gpio_from_xenstore(libxl__gc *gc, const char *libxl_path,
+                                    libxl_devid devid,
+                                    libxl_device_gpio *gpio)
+{
+    const char *be_path, *fe_path, *tmp;
+    libxl__device dev;
+    int rc;
+
+    gpio->devid = devid;
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
+    rc = libxl__backendpath_parse_domid(gc, be_path, &gpio->backend_domid);
+    if (rc) goto out;
+
+    rc = libxl__parse_backend_path(gc, be_path, &dev);
+    if (rc) goto out;
+
+    gpio->backend_type = LIBXL_GPIO_BACKEND_VIRTIO;
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/irq", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        gpio->irq = strtoul(tmp, NULL, 0);
+    }
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/base", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        gpio->base = strtoul(tmp, NULL, 0);
+    }
+
+    rc = 0;
+
+out:
+
+    return rc;
+}
+
+static int libxl__device_from_gpio(libxl__gc *gc, uint32_t domid,
+                                  libxl_device_gpio *type, libxl__device *device)
+{
+    device->backend_devid   = type->devid;
+    device->backend_domid   = type->backend_domid;
+    device->backend_kind    = LIBXL__DEVICE_KIND_GPIO;
+    device->devid           = type->devid;
+    device->domid           = domid;
+    device->kind            = LIBXL__DEVICE_KIND_GPIO;
+
+    return 0;
+}
+
+int libxl_device_gpio_add(libxl_ctx *ctx, uint32_t domid, libxl_device_gpio *gpio,
+                         const libxl_asyncop_how *ao_how)
+{
+    AO_CREATE(ctx, domid, ao_how);
+    int rc;
+
+    rc = libxl__device_add(gc, domid, &libxl__gpio_devtype, gpio);
+    if (rc) {
+        LOGD(ERROR, domid, "Unable to add gpio device");
+        goto out;
+    }
+
+out:
+    libxl__ao_complete(egc, ao, rc);
+    return AO_INPROGRESS;
+}
+
+int libxl_devid_to_device_gpio(libxl_ctx *ctx, uint32_t domid,
+                              int devid, libxl_device_gpio *gpio)
+{
+    GC_INIT(ctx);
+
+    libxl_device_gpio *gpios = NULL;
+    int n, i;
+    int rc;
+
+    libxl_device_gpio_init(gpio);
+
+    gpios = libxl__device_list(gc, &libxl__gpio_devtype, domid, &n);
+
+    if (!gpios) { rc = ERROR_NOTFOUND; goto out; }
+
+    for (i = 0; i < n; ++i) {
+        if (devid == gpios[i].devid) {
+            libxl_device_gpio_copy(ctx, gpio, &gpios[i]);
+            rc = 0;
+            goto out;
+        }
+    }
+
+    rc = ERROR_NOTFOUND;
+
+out:
+
+    if (gpios)
+        libxl__device_list_free(&libxl__gpio_devtype, gpios, n);
+
+    GC_FREE;
+    return rc;
+}
+
+int libxl_device_gpio_getinfo(libxl_ctx *ctx, uint32_t domid,
+                             const libxl_device_gpio *gpio,
+                             libxl_gpioinfo *info)
+{
+    GC_INIT(ctx);
+    char *libxl_path, *dompath, *devpath;
+    char *val;
+    int rc;
+
+    libxl_gpioinfo_init(info);
+    dompath = libxl__xs_get_dompath(gc, domid);
+    info->devid = gpio->devid;
+
+    devpath = libxl__domain_device_frontend_path(gc, domid, info->devid,
+                                                 LIBXL__DEVICE_KIND_GPIO);
+    libxl_path = libxl__domain_device_libxl_path(gc, domid, info->devid,
+                                                 LIBXL__DEVICE_KIND_GPIO);
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
+    val = libxl__xs_read(gc, XBT_NULL,
+          GCSPRINTF("%s/"XENKBD_FIELD_EVT_CHANNEL, devpath));
+    info->evtch = val ? strtoul(val, NULL, 10) : -1;
+
+    val = libxl__xs_read(gc, XBT_NULL,
+          GCSPRINTF("%s/"XENKBD_FIELD_RING_GREF, devpath));
+    info->rref = val ? strtoul(val, NULL, 10) : -1;
+
+    rc = 0;
+
+out:
+     GC_FREE;
+     return rc;
+}
+
+static LIBXL_DEFINE_UPDATE_DEVID(gpio)
+
+#define libxl__add_gpios NULL
+#define libxl_device_gpio_compare NULL
+
+LIBXL_DEFINE_DEVICE_LIST(gpio)
+LIBXL_DEFINE_DEVICE_REMOVE(gpio)
+
+DEFINE_DEVICE_TYPE_STRUCT(gpio, GPIO, gpios,
+    .skip_attach = 1,
+    .dm_needed = libxl__device_gpio_dm_needed,
+    .set_xenstore_config = (device_set_xenstore_config_fn_t)
+                           libxl__set_xenstore_gpio,
+    .from_xenstore = (device_from_xenstore_fn_t)libxl__gpio_from_xenstore
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
index b4dfbe7e5db1..7bbd9601ea7c 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4001,6 +4001,7 @@ static inline int *libxl__device_type_get_num(
 
 extern const libxl__device_type libxl__vfb_devtype;
 extern const libxl__device_type libxl__vkb_devtype;
+extern const libxl__device_type libxl__gpio_devtype;
 extern const libxl__device_type libxl__i2c_devtype;
 extern const libxl__device_type libxl__disk_devtype;
 extern const libxl__device_type libxl__nic_devtype;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index e9454e669224..b5a5cb99c2b4 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -266,6 +266,10 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
     (2, "LINUX")
     ])
 
+libxl_gpio_backend = Enumeration("gpio_backend", [
+    (0, "VIRTIO")
+    ])
+
 libxl_i2c_backend = Enumeration("i2c_backend", [
     (0, "VIRTIO")
     ])
@@ -618,6 +622,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                        # - "mouse" for PS/2 protocol relative mouse
                                        ("usbdevice",        string),
                                        ("vkb_device",       libxl_defbool),
+                                       ("gpio_device",       libxl_defbool),
                                        ("i2c_device",       libxl_defbool),
                                        ("soundhw",          string),
                                        ("xen_platform_pci", libxl_defbool),
@@ -696,6 +701,15 @@ libxl_device_vkb = Struct("device_vkb", [
     ("multi_touch_num_contacts", uint32)
     ])
 
+libxl_device_gpio = Struct("device_gpio", [
+    ("backend_domid", libxl_domid),
+    ("backend_domname", string),
+    ("devid", libxl_devid),
+    ("backend_type", libxl_gpio_backend),
+    ("irq", uint32),
+    ("base", uint64)
+    ])
+
 libxl_device_i2c = Struct("device_i2c", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -974,6 +988,7 @@ libxl_domain_config = Struct("domain_config", [
     ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
     ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
     ("vkbs", Array(libxl_device_vkb, "num_vkbs")),
+    ("gpios", Array(libxl_device_gpio, "num_gpios")),
     ("i2cs", Array(libxl_device_i2c, "num_i2cs")),
     ("vtpms", Array(libxl_device_vtpm, "num_vtpms")),
     ("p9s", Array(libxl_device_p9, "num_p9s")),
@@ -1136,6 +1151,17 @@ libxl_vkbinfo = Struct("vkbinfo", [
     ("rref", integer)
     ], dir=DIR_OUT)
 
+libxl_gpioinfo = Struct("gpioinfo", [
+    ("backend", string),
+    ("backend_id", uint32),
+    ("frontend", string),
+    ("frontend_id", uint32),
+    ("devid", libxl_devid),
+    ("state", integer),
+    ("evtch", integer),
+    ("rref", integer)
+    ], dir=DIR_OUT)
+
 libxl_i2cinfo = Struct("i2cinfo", [
     ("backend", string),
     ("backend_id", uint32),
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index 1b87d1480bf9..3bb79c2a063a 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -33,6 +33,7 @@ libxl__device_kind = Enumeration("device_kind", [
     (15, "VSND"),
     (16, "VINPUT"),
     (17, "I2C"),
+    (18, "GPIO"),
     ])
 
 libxl__console_backend = Enumeration("console_backend", [
diff --git a/tools/ocaml/libs/xl/genwrap.py b/tools/ocaml/libs/xl/genwrap.py
index a9db0b97d80f..ffab4b362d2a 100644
--- a/tools/ocaml/libs/xl/genwrap.py
+++ b/tools/ocaml/libs/xl/genwrap.py
@@ -36,6 +36,7 @@ DEVICE_LIST =      [ ("list",           ["ctx", "domid", "t list"]),
 functions = { # ( name , [type1,type2,....] )
     "device_vfb":     DEVICE_FUNCTIONS,
     "device_vkb":     DEVICE_FUNCTIONS,
+    "device_gpio":     DEVICE_FUNCTIONS,
     "device_i2c":     DEVICE_FUNCTIONS,
     "device_disk":    DEVICE_FUNCTIONS + DEVICE_LIST +
                       [ ("insert",         ["ctx", "t", "domid", "?async:'a", "unit", "unit"]),
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index cdf473f4ed57..0114cc22a1b6 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -707,6 +707,7 @@ DEVICE_ADDREMOVE(disk)
 DEVICE_ADDREMOVE(nic)
 DEVICE_ADDREMOVE(vfb)
 DEVICE_ADDREMOVE(vkb)
+DEVICE_ADDREMOVE(gpio)
 DEVICE_ADDREMOVE(i2c)
 DEVICE_ADDREMOVE(pci)
 _DEVICE_ADDREMOVE(disk, cdrom, insert)
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index 06801962f11e..34ff203bfd86 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -23,7 +23,7 @@ XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
 XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
 XL_OBJS += xl_info.o xl_console.o xl_misc.o
 XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
-XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o xl_i2c.o
+XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o xl_gpio.o xl_i2c.o
 
 $(XL_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(XL_OBJS): CFLAGS += $(CFLAGS_XL)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 210bc1b6d47a..b2110b125ae4 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -177,6 +177,9 @@ int main_vsnddetach(int argc, char **argv);
 int main_vkbattach(int argc, char **argv);
 int main_vkblist(int argc, char **argv);
 int main_vkbdetach(int argc, char **argv);
+int main_gpioattach(int argc, char **argv);
+int main_gpiolist(int argc, char **argv);
+int main_gpiodetach(int argc, char **argv);
 int main_i2cattach(int argc, char **argv);
 int main_i2clist(int argc, char **argv);
 int main_i2cdetach(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 30bd614fc275..20bfedb74a7b 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -406,6 +406,21 @@ const struct cmd_spec cmd_table[] = {
       "Destroy a domain's virtual keyboard device",
       "<Domain> <DevId>",
     },
+    { "gpio-attach",
+      &main_gpioattach, 1, 1,
+      "Create a new virtual gpio device",
+      "<Domain> <gpio-spec-component(s)>...",
+    },
+    { "gpio-list",
+      &main_gpiolist, 0, 0,
+      "List virtual gpio devices for a domain",
+      "<Domain(s)>",
+    },
+    { "gpio-detach",
+      &main_gpiodetach, 0, 1,
+      "Destroy a domain's virtual gpio device",
+      "<Domain> <DevId>",
+    },
     { "i2c-attach",
       &main_i2cattach, 1, 1,
       "Create a new virtual i2c device",
diff --git a/tools/xl/xl_gpio.c b/tools/xl/xl_gpio.c
new file mode 100644
index 000000000000..85c0b25411c7
--- /dev/null
+++ b/tools/xl/xl_gpio.c
@@ -0,0 +1,143 @@
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
+int main_gpioattach(int argc, char **argv)
+{
+    int opt;
+    int rc;
+    uint32_t domid;
+    libxl_device_gpio gpio;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "gpio-attach", 2) {
+        /* No options */
+    }
+
+    libxl_device_gpio_init(&gpio);
+    domid = find_domain(argv[optind++]);
+
+    for (argv += optind, argc -= optind; argc > 0; ++argv, --argc) {
+        rc = parse_gpio_config(&gpio, *argv);
+        if (rc) goto out;
+    }
+
+    if (dryrun_only) {
+        char *json = libxl_device_gpio_to_json(ctx, &gpio);
+        printf("gpio: %s\n", json);
+        free(json);
+        goto done;
+    }
+
+    if (libxl_device_gpio_add(ctx, domid, &gpio, 0)) {
+        fprintf(stderr, "libxl_device_gpio_add failed.\n");
+        rc = ERROR_FAIL; goto out;
+    }
+
+done:
+    rc = 0;
+
+out:
+    libxl_device_gpio_dispose(&gpio);
+    return rc;
+}
+
+int main_gpiolist(int argc, char **argv)
+{
+    int opt;
+    libxl_device_gpio *gpios;
+    libxl_gpioinfo gpioinfo;
+    int nb, i;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "gpio-list", 1) {
+        /* No options */
+    }
+
+    /*      Idx  BE   Hdl  Sta  evch ref ID    BE-type BE-path */
+    printf("%-3s %-2s %-6s %-5s %-6s %6s %-10s %-10s %-30s\n",
+           "Idx", "BE", "handle", "state", "evt-ch", "ref",
+           "ID", "BE-type", "BE-path");
+    for (argv += optind, argc -= optind; argc > 0; --argc, ++argv) {
+        uint32_t domid = find_domain(*argv);
+        gpios = libxl_device_gpio_list(ctx, domid, &nb);
+        if (!gpios) {
+            continue;
+        }
+        for (i = 0; i < nb; ++i) {
+            if (libxl_device_gpio_getinfo(ctx, domid, &gpios[i], &gpioinfo) == 0) {
+                printf("%-3d %-2d %6d %5d %6d %6d %-10s %-30s\n",
+                       gpioinfo.devid, gpioinfo.backend_id,
+                       gpioinfo.devid, gpioinfo.state, gpioinfo.evtch,
+                       gpioinfo.rref,
+                       libxl_gpio_backend_to_string(gpios[i].backend_type),
+                       gpioinfo.backend);
+                libxl_gpioinfo_dispose(&gpioinfo);
+            }
+        }
+        libxl_device_gpio_list_free(gpios, nb);
+    }
+    return 0;
+}
+
+int main_gpiodetach(int argc, char **argv)
+{
+    uint32_t domid, devid;
+    int opt, rc;
+    libxl_device_gpio gpio;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "gpio-detach", 2) {
+        /* No options */
+    }
+
+    domid = find_domain(argv[optind++]);
+    devid = atoi(argv[optind++]);
+
+    libxl_device_gpio_init(&gpio);
+
+    if (libxl_devid_to_device_gpio(ctx, domid, devid, &gpio)) {
+        fprintf(stderr, "Error: Device %d not connected.\n", devid);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    rc = libxl_device_gpio_remove(ctx, domid, &gpio, 0);
+    if (rc) {
+        fprintf(stderr, "libxl_device_gpio_remove failed.\n");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    rc = 0;
+
+out:
+    libxl_device_gpio_dispose(&gpio);
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
index 95483e551c38..7ab4f22821c4 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1204,6 +1204,74 @@ static void parse_vkb_list(const XLU_Config *config,
     if (rc) exit(EXIT_FAILURE);
 }
 
+int parse_gpio_config(libxl_device_gpio *gpio, char *token)
+{
+    char *oparg;
+
+    if (MATCH_OPTION("backend", token, oparg)) {
+        gpio->backend_domname = strdup(oparg);
+    } else if (MATCH_OPTION("backend-type", token, oparg)) {
+        libxl_gpio_backend backend_type;
+        if (libxl_gpio_backend_from_string(oparg, &backend_type)) {
+            fprintf(stderr, "Unknown backend_type \"%s\" in gpio spec\n",
+                            oparg);
+            return -1;
+        }
+        gpio->backend_type = backend_type;
+    } else if (MATCH_OPTION("irq", token, oparg)) {
+        gpio->irq = strtoul(oparg, NULL, 0);
+    } else if (MATCH_OPTION("base", token, oparg)) {
+        gpio->base = strtoul(oparg, NULL, 0);
+    } else {
+        fprintf(stderr, "Unknown string \"%s\" in gpio spec\n", token);
+        return -1;
+    }
+
+    return 0;
+}
+
+static void parse_gpio_list(const XLU_Config *config,
+                           libxl_domain_config *d_config)
+{
+    XLU_ConfigList *gpios;
+    const char *item;
+    char *buf = NULL;
+    int rc;
+
+    if (!xlu_cfg_get_list (config, "gpio", &gpios, 0, 0)) {
+        int entry = 0;
+        while ((item = xlu_cfg_get_listitem(gpios, entry)) != NULL) {
+            libxl_device_gpio *gpio;
+            char *p;
+
+            gpio = ARRAY_EXTEND_INIT(d_config->gpios,
+                                    d_config->num_gpios,
+                                    libxl_device_gpio_init);
+
+            buf = strdup(item);
+
+            p = strtok (buf, ",");
+            while (p != NULL)
+            {
+                while (*p == ' ') p++;
+
+                rc = parse_gpio_config(gpio, p);
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
 int parse_i2c_config(libxl_device_i2c *i2c, char *token)
 {
     char *oparg;
@@ -2373,15 +2441,18 @@ void parse_config_data(const char *config_source,
 
     d_config->num_vfbs = 0;
     d_config->num_vkbs = 0;
+    d_config->num_gpios = 0;
     d_config->num_i2cs = 0;
     d_config->vfbs = NULL;
     d_config->vkbs = NULL;
+    d_config->gpios = NULL;
     d_config->i2cs = NULL;
 
     if (!xlu_cfg_get_list (config, "vfb", &cvfbs, 0, 0)) {
         while ((buf = xlu_cfg_get_listitem (cvfbs, d_config->num_vfbs)) != NULL) {
             libxl_device_vfb *vfb;
             libxl_device_vkb *vkb;
+            libxl_device_gpio *gpio;
             libxl_device_i2c *i2c;
 
             char *buf2 = strdup(buf);
@@ -2393,6 +2464,9 @@ void parse_config_data(const char *config_source,
             vkb = ARRAY_EXTEND_INIT(d_config->vkbs, d_config->num_vkbs,
                                     libxl_device_vkb_init);
 
+            gpio = ARRAY_EXTEND_INIT(d_config->gpios, d_config->num_gpios,
+                                    libxl_device_gpio_init);
+
             i2c = ARRAY_EXTEND_INIT(d_config->i2cs, d_config->num_i2cs,
                                     libxl_device_i2c_init);
 
@@ -2653,6 +2727,7 @@ void parse_config_data(const char *config_source,
         if (vnc_enabled) {
             libxl_device_vfb *vfb;
             libxl_device_vkb *vkb;
+            libxl_device_gpio *gpio;
             libxl_device_i2c *i2c;
 
             vfb = ARRAY_EXTEND_INIT(d_config->vfbs, d_config->num_vfbs,
@@ -2661,6 +2736,9 @@ void parse_config_data(const char *config_source,
             vkb = ARRAY_EXTEND_INIT(d_config->vkbs, d_config->num_vkbs,
                                     libxl_device_vkb_init);
 
+            gpio = ARRAY_EXTEND_INIT(d_config->gpios, d_config->num_gpios,
+                                    libxl_device_gpio_init);
+
             i2c = ARRAY_EXTEND_INIT(d_config->i2cs, d_config->num_i2cs,
                                     libxl_device_i2c_init);
 
@@ -2778,6 +2856,7 @@ void parse_config_data(const char *config_source,
             exit(-ERROR_FAIL);
         }
         xlu_cfg_get_defbool(config, "vkb_device", &b_info->u.hvm.vkb_device, 0);
+        xlu_cfg_get_defbool(config, "gpio_device", &b_info->u.hvm.gpio_device, 0);
         xlu_cfg_get_defbool(config, "i2c_device", &b_info->u.hvm.i2c_device, 0);
         xlu_cfg_replace_string (config, "soundhw", &b_info->u.hvm.soundhw, 0);
         xlu_cfg_get_defbool(config, "xen_platform_pci",
@@ -2827,6 +2906,7 @@ void parse_config_data(const char *config_source,
     }
 
     parse_vkb_list(config, d_config);
+    parse_gpio_list(config, d_config);
     parse_i2c_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
diff --git a/tools/xl/xl_parse.h b/tools/xl/xl_parse.h
index 4b972d525199..6e041abe5d50 100644
--- a/tools/xl/xl_parse.h
+++ b/tools/xl/xl_parse.h
@@ -36,6 +36,7 @@ int parse_nic_config(libxl_device_nic *nic, XLU_Config **config, char *token);
 int parse_vdispl_config(libxl_device_vdispl *vdispl, char *token);
 int parse_vsnd_item(libxl_device_vsnd *vsnd, const char *spec);
 int parse_vkb_config(libxl_device_vkb *vkb, char *token);
+int parse_gpio_config(libxl_device_gpio *gpio, char *token);
 int parse_i2c_config(libxl_device_i2c *i2c, char *token);
 
 int match_option_size(const char *prefix, size_t len,
diff --git a/tools/xl/xl_sxp.c b/tools/xl/xl_sxp.c
index a44c765aa515..632e1f338d09 100644
--- a/tools/xl/xl_sxp.c
+++ b/tools/xl/xl_sxp.c
@@ -140,6 +140,8 @@ void printf_info_sexp(int domid, libxl_domain_config *d_config, FILE *fh)
         fprintf(fh, "\t\t\t(usbdevice %s)\n", b_info->u.hvm.usbdevice);
         fprintf(fh, "\t\t\t(vkb_device %s)\n",
                libxl_defbool_to_string(b_info->u.hvm.vkb_device));
+        fprintf(fh, "\t\t\t(gpio_device %s)\n",
+               libxl_defbool_to_string(b_info->u.hvm.gpio_device));
         fprintf(fh, "\t\t\t(i2c_device %s)\n",
                libxl_defbool_to_string(b_info->u.hvm.i2c_device));
         fprintf(fh, "\t\t)\n");
-- 
2.31.1.272.g89b43f80a514


