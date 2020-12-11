Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC692D818A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 23:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50930.89793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knqZO-0006qx-GH; Fri, 11 Dec 2020 22:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50930.89793; Fri, 11 Dec 2020 22:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knqZO-0006qX-9b; Fri, 11 Dec 2020 22:07:22 +0000
Received: by outflank-mailman (input) for mailman id 50930;
 Fri, 11 Dec 2020 22:07:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Vdm=FP=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1knqZM-0006qM-ON
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 22:07:20 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ad07fcae-a49e-428d-9bc2-121e19c1c9c6;
 Fri, 11 Dec 2020 22:07:19 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-UpP2mNjkPBywjRPvEBuG2A-1; Fri, 11 Dec 2020 17:07:15 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9232C292;
 Fri, 11 Dec 2020 22:07:12 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB9BF5D9E2;
 Fri, 11 Dec 2020 22:07:04 +0000 (UTC)
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
X-Inumbo-ID: ad07fcae-a49e-428d-9bc2-121e19c1c9c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607724439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=liR73qHgx91bdEvSe0pRJgUhS7neRyLuX3mOz/BU+gI=;
	b=eg1tAX/G2AAy/coUwyuoVaHmJ4QWjK+OCIsXL2HEzBwN/WBmRBRO4VqxiTiQReCWDi1Ss+
	kQjMExMTfoJLXRqX/wtrkceiht6Ik3h7bxKzuRRTkg/MH1HNvsxWMtUg/MgTcwNJdfLAb5
	Clkdj/9Q5KZhQn7Zda1Ijjn3C4OCB8s=
X-MC-Unique: UpP2mNjkPBywjRPvEBuG2A-1
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Max Reitz <mreitz@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	David Hildenbrand <david@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v4 23/32] qdev: Move dev->realized check to qdev_property_set()
Date: Fri, 11 Dec 2020 17:05:20 -0500
Message-Id: <20201211220529.2290218-24-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-1-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Every single qdev property setter function manually checks
dev->realized.  We can just check dev->realized inside
qdev_property_set() instead.

The check is being added as a separate function
(qdev_prop_allow_set()) because it will become a callback later.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Removed unused variable at xen_block_set_vdev()
* Redone patch after changes in the previous patches in the
  series
---
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 backends/tpm/tpm_util.c          |   6 --
 hw/block/xen-block.c             |   6 --
 hw/core/qdev-properties-system.c |  70 ----------------------
 hw/core/qdev-properties.c        | 100 ++++++-------------------------
 hw/s390x/css.c                   |   6 --
 hw/s390x/s390-pci-bus.c          |   6 --
 hw/vfio/pci-quirks.c             |   6 --
 target/sparc/cpu.c               |   6 --
 8 files changed, 18 insertions(+), 188 deletions(-)

diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index a5d997e7dc..39b45fa46d 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -46,16 +46,10 @@ static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     TPMBackend *s, **be = qdev_get_prop_ptr(obj, prop);
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 905e4acd97..bd1aef63a7 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -395,17 +395,11 @@ static int vbd_name_to_disk(const char *name, const char **endp,
 static void xen_block_set_vdev(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
     char *str, *p;
     const char *end;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 42529c3b65..f31aea3de1 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -94,11 +94,6 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
     bool blk_created = false;
     int ret;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -230,17 +225,11 @@ static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     CharBackend *be = qdev_get_prop_ptr(obj, prop);
     Chardev *s;
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -311,18 +300,12 @@ static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     MACAddr *mac = qdev_get_prop_ptr(obj, prop);
     int i, pos;
     char *str;
     const char *p;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -390,7 +373,6 @@ static void get_netdev(Object *obj, Visitor *v, const char *name,
 static void set_netdev(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
     NetClientState **ncs = peers_ptr->ncs;
@@ -398,11 +380,6 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
     int queues, err = 0, i = 0;
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -469,18 +446,12 @@ static void get_audiodev(Object *obj, Visitor *v, const char* name,
 static void set_audiodev(Object *obj, Visitor *v, const char* name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
     AudioState *state;
     int err = 0;
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -582,11 +553,6 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
     uint64_t value;
     Error *local_err = NULL;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_size(v, name, &value, errp)) {
         return;
     }
@@ -686,7 +652,6 @@ static void get_reserved_region(Object *obj, Visitor *v, const char *name,
 static void set_reserved_region(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
     Error *local_err = NULL;
@@ -694,11 +659,6 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
     char *str;
     int ret;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_str(v, name, &str, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -754,17 +714,11 @@ const PropertyInfo qdev_prop_reserved_region = {
 static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     int32_t value, *ptr = qdev_get_prop_ptr(obj, prop);
     unsigned int slot, fn, n;
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, NULL)) {
         if (!visit_type_int32(v, name, &value, errp)) {
             return;
@@ -848,7 +802,6 @@ static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
 static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
     char *str, *p;
@@ -857,11 +810,6 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     unsigned long dom = 0, bus = 0;
     unsigned int slot = 0, func = 0;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -972,16 +920,10 @@ static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
 static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
     int speed;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_enum(v, name, &speed, prop->info->enum_table,
                          errp)) {
         return;
@@ -1057,16 +999,10 @@ static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
 static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
     int width;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_enum(v, name, &width, prop->info->enum_table,
                          errp)) {
         return;
@@ -1129,16 +1065,10 @@ static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index b924f13d58..92f48ecbf2 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -24,6 +24,19 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
     }
 }
 
+/* returns: true if property is allowed to be set, false otherwise */
+static bool qdev_prop_allow_set(Object *obj, const char *name,
+                                Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    if (dev->realized) {
+        qdev_prop_set_after_realize(dev, name, errp);
+        return false;
+    }
+    return true;
+}
+
 void qdev_prop_allow_set_link_before_realize(const Object *obj,
                                              const char *name,
                                              Object *val, Error **errp)
@@ -65,6 +78,11 @@ static void field_prop_set(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
     Property *prop = opaque;
+
+    if (!qdev_prop_allow_set(obj, name, errp)) {
+        return;
+    }
+
     return prop->info->set(obj, v, name, opaque, errp);
 }
 
@@ -90,15 +108,9 @@ void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
 void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     int *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
 }
 
@@ -148,15 +160,9 @@ static void prop_get_bit(Object *obj, Visitor *v, const char *name,
 static void prop_set_bit(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     bool value;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_bool(v, name, &value, errp)) {
         return;
     }
@@ -208,15 +214,9 @@ static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
 static void prop_set_bit64(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     bool value;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_bool(v, name, &value, errp)) {
         return;
     }
@@ -245,15 +245,9 @@ static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     bool *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_bool(v, name, ptr, errp);
 }
 
@@ -278,15 +272,9 @@ static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_uint8(v, name, ptr, errp);
 }
 
@@ -323,15 +311,9 @@ static void get_uint16(Object *obj, Visitor *v, const char *name,
 static void set_uint16(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_uint16(v, name, ptr, errp);
 }
 
@@ -356,15 +338,9 @@ static void get_uint32(Object *obj, Visitor *v, const char *name,
 static void set_uint32(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_uint32(v, name, ptr, errp);
 }
 
@@ -380,15 +356,9 @@ void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
 static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     int32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_int32(v, name, ptr, errp);
 }
 
@@ -420,15 +390,9 @@ static void get_uint64(Object *obj, Visitor *v, const char *name,
 static void set_uint64(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_uint64(v, name, ptr, errp);
 }
 
@@ -444,15 +408,9 @@ static void get_int64(Object *obj, Visitor *v, const char *name,
 static void set_int64(Object *obj, Visitor *v, const char *name,
                       void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     int64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_int64(v, name, ptr, errp);
 }
 
@@ -495,16 +453,10 @@ static void get_string(Object *obj, Visitor *v, const char *name,
 static void set_string(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     char **ptr = qdev_get_prop_ptr(obj, prop);
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
@@ -545,16 +497,10 @@ void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
 static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
                        Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
     uint64_t value;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_size(v, name, &value, errp)) {
         return;
     }
@@ -621,10 +567,6 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
     const char *arrayname;
     int i;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
     if (*alenptr) {
         error_setg(errp, "array size property %s may not be set more than once",
                    name);
@@ -864,15 +806,9 @@ static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_size(v, name, ptr, errp);
 }
 
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 7a44320d12..496e2c5801 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2372,18 +2372,12 @@ static void get_css_devid(Object *obj, Visitor *v, const char *name,
 static void set_css_devid(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
     char *str;
     int num, n1, n2;
     unsigned int cssid, ssid, devid;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_str(v, name, &str, errp)) {
         return;
     }
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 8b6be1197b..30511f620e 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1338,16 +1338,10 @@ static void s390_pci_get_fid(Object *obj, Visitor *v, const char *name,
 static void s390_pci_set_fid(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     S390PCIBusDevice *zpci = S390_PCI_DEVICE(obj);
     Property *prop = opaque;
     uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_uint32(v, name, ptr, errp)) {
         return;
     }
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 53569925a2..802979635c 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1498,15 +1498,9 @@ static void set_nv_gpudirect_clique_id(Object *obj, Visitor *v,
                                        const char *name, void *opaque,
                                        Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
     uint8_t value, *ptr = qdev_get_prop_ptr(obj, prop);
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_uint8(v, name, &value, errp)) {
         return;
     }
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 92534bcd18..b730146bbe 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -798,17 +798,11 @@ static void sparc_get_nwindows(Object *obj, Visitor *v, const char *name,
 static void sparc_set_nwindows(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     const int64_t min = MIN_NWINDOWS;
     const int64_t max = MAX_NWINDOWS;
     SPARCCPU *cpu = SPARC_CPU(obj);
     int64_t value;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     if (!visit_type_int(v, name, &value, errp)) {
         return;
     }
-- 
2.28.0


