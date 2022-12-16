Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA964E9C5
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 11:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464357.722728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p68HK-00022x-Bi; Fri, 16 Dec 2022 10:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464357.722728; Fri, 16 Dec 2022 10:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p68HK-00020T-7b; Fri, 16 Dec 2022 10:49:22 +0000
Received: by outflank-mailman (input) for mailman id 464357;
 Fri, 16 Dec 2022 10:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Zr/=4O=citrix.com=prvs=342bb51ac=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p68HI-00020N-Mi
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 10:49:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49af3d18-7d2f-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 11:49:18 +0100 (CET)
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
X-Inumbo-ID: 49af3d18-7d2f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671187758;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=5+cCNgheqSgUPp/xLGI/9a3m+21acDQow0j7IQhZYnQ=;
  b=fgjnQ5RUm0URJ83tztue3u01L1wBqYh6xn84MpZV3c9IQ/7i09ht6vgL
   Yu9rP+QTfeR645jDCWxtMW5Njm7A260gh933kVDI4/JxpSNGoXzIIUpI7
   Eo1ex5NKYuZ5VRfVJ0uGVFA1rxcuSfQnFq2t2BHiVMeRORfY3YxMKyDcD
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88239411
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:dMHNAqNKAasbecXvrR1tl8FynXyQoLVcMsEvi/4bfWQNrUpw1GRTz
 GIfCDuOPPrZY2KgfNhzaI/k9hkBvp7UyIc1Tgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ux9JkJWq
 tIiETM2Xx6Yuf6N7OKkdfY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9KozQHpQJxx/wS
 mTu1HrJOQo1NuyklmSZ/kKstrDPkDKncddHfFG/3qEz2wDCroAJMzUNTkeyq/S9jk+4WvpcJ
 lYS9y5oqrI9nGS0SvHtUhv+p2SL1jYeRt5RHusS+AyLjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+Oqii4Iy8SLmkqaioNTA9D6N7myKkRpB/SStdoEIauk8b4Xzr3x
 li3QDMW3utJy5RRjuPioA6B02nESoX1ohAd7A/wfXr6wDlAZ7WUaZeW9WP3vel/M9PMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1Hs2DaJz9zq3+KTJrU3YE
 cnzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDKEO5fYQLfPrhlsstoRTk5F
 P4GZ6O3J+h3CrWiMkE7D6ZNRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fsLUAJIuRYc1Buvr6Qp
 BmVAxYIoGcTcFWbcW1mnFg/MuKwNXu+xFpnVRER0aGAhyJ5P93zsP5DKfPav9APrYRe8BK9d
 NFdE+3oPxiFYm2vF+g1BXUlkLFfSQ==
IronPort-HdrOrdr: A9a23:i2hVjq5yaVB+yEgp/gPXwNnXdLJyesId70hD6qkRc3Fom6mj/K
 qTdZsgpHzJYUkqKRMdcLy7VpVoIkmxyXcW2+ks1N6ZNWHbUQCTQ72Kg7GC/9ToIVyaytJg
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="88239411"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Jan
 Beulich" <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Wei Liu" <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH] tools/golang: Refresh bindings following virtio changes
Date: Fri, 16 Dec 2022 10:49:04 +0000
Message-ID: <20221216104904.3348-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Nick Rosbrook <rosbrookn@gmail.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 tools/golang/xenlight/helpers.gen.go | 62 ++++++++++++++++++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   | 17 ++++++++++
 2 files changed, 79 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index cb1bdf9bdf41..3ac4938858f2 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1722,6 +1722,49 @@ xc.multi_touch_num_contacts = C.uint32_t(x.MultiTouchNumContacts)
  return nil
  }
 
+// NewDeviceVirtio returns an instance of DeviceVirtio initialized with defaults.
+func NewDeviceVirtio() (*DeviceVirtio, error) {
+var (
+x DeviceVirtio
+xc C.libxl_device_virtio)
+
+C.libxl_device_virtio_init(&xc)
+defer C.libxl_device_virtio_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *DeviceVirtio) fromC(xc *C.libxl_device_virtio) error {
+ x.BackendDomid = Domid(xc.backend_domid)
+x.BackendDomname = C.GoString(xc.backend_domname)
+x.Type = C.GoString(xc._type)
+x.Transport = VirtioTransport(xc.transport)
+x.Devid = Devid(xc.devid)
+x.Irq = uint32(xc.irq)
+x.Base = uint64(xc.base)
+
+ return nil}
+
+func (x *DeviceVirtio) toC(xc *C.libxl_device_virtio) (err error){defer func(){
+if err != nil{
+C.libxl_device_virtio_dispose(xc)}
+}()
+
+xc.backend_domid = C.libxl_domid(x.BackendDomid)
+if x.BackendDomname != "" {
+xc.backend_domname = C.CString(x.BackendDomname)}
+if x.Type != "" {
+xc._type = C.CString(x.Type)}
+xc.transport = C.libxl_virtio_transport(x.Transport)
+xc.devid = C.libxl_devid(x.Devid)
+xc.irq = C.uint32_t(x.Irq)
+xc.base = C.uint64_t(x.Base)
+
+ return nil
+ }
+
 // NewDeviceDisk returns an instance of DeviceDisk initialized with defaults.
 func NewDeviceDisk() (*DeviceDisk, error) {
 var (
@@ -2855,6 +2898,15 @@ if err := x.Vkbs[i].fromC(&v); err != nil {
 return fmt.Errorf("converting field Vkbs: %v", err) }
 }
 }
+x.Virtios = nil
+if n := int(xc.num_virtios); n > 0 {
+cVirtios := (*[1<<28]C.libxl_device_virtio)(unsafe.Pointer(xc.virtios))[:n:n]
+x.Virtios = make([]DeviceVirtio, n)
+for i, v := range cVirtios {
+if err := x.Virtios[i].fromC(&v); err != nil {
+return fmt.Errorf("converting field Virtios: %v", err) }
+}
+}
 x.Vtpms = nil
 if n := int(xc.num_vtpms); n > 0 {
 cVtpms := (*[1<<28]C.libxl_device_vtpm)(unsafe.Pointer(xc.vtpms))[:n:n]
@@ -3016,6 +3068,16 @@ return fmt.Errorf("converting field Vkbs: %v", err)
 }
 }
 }
+if numVirtios := len(x.Virtios); numVirtios > 0 {
+xc.virtios = (*C.libxl_device_virtio)(C.malloc(C.ulong(numVirtios)*C.sizeof_libxl_device_virtio))
+xc.num_virtios = C.int(numVirtios)
+cVirtios := (*[1<<28]C.libxl_device_virtio)(unsafe.Pointer(xc.virtios))[:numVirtios:numVirtios]
+for i,v := range x.Virtios {
+if err := v.toC(&cVirtios[i]); err != nil {
+return fmt.Errorf("converting field Virtios: %v", err)
+}
+}
+}
 if numVtpms := len(x.Vtpms); numVtpms > 0 {
 xc.vtpms = (*C.libxl_device_vtpm)(C.malloc(C.ulong(numVtpms)*C.sizeof_libxl_device_vtpm))
 xc.num_vtpms = C.int(numVtpms)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 871576fb0e23..16ce879e3fb7 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -255,6 +255,12 @@ VkbBackendQemu VkbBackend = 1
 VkbBackendLinux VkbBackend = 2
 )
 
+type VirtioTransport int
+const(
+VirtioTransportUnknown VirtioTransport = 0
+VirtioTransportMmio VirtioTransport = 1
+)
+
 type Passthrough int
 const(
 PassthroughDefault Passthrough = 0
@@ -644,6 +650,16 @@ MultiTouchHeight uint32
 MultiTouchNumContacts uint32
 }
 
+type DeviceVirtio struct {
+BackendDomid Domid
+BackendDomname string
+Type string
+Transport VirtioTransport
+Devid Devid
+Irq uint32
+Base uint64
+}
+
 type DeviceDisk struct {
 BackendDomid Domid
 BackendDomname string
@@ -933,6 +949,7 @@ Rdms []DeviceRdm
 Dtdevs []DeviceDtdev
 Vfbs []DeviceVfb
 Vkbs []DeviceVkb
+Virtios []DeviceVirtio
 Vtpms []DeviceVtpm
 P9S []DeviceP9
 Pvcallsifs []DevicePvcallsif
-- 
2.11.0


