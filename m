Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C82A68F7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 17:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19398.44566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaLFB-0005pY-Ua; Wed, 04 Nov 2020 16:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19398.44566; Wed, 04 Nov 2020 16:02:41 +0000
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
	id 1kaLFB-0005p9-Qv; Wed, 04 Nov 2020 16:02:41 +0000
Received: by outflank-mailman (input) for mailman id 19398;
 Wed, 04 Nov 2020 16:02:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aHic=EK=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kaLFA-0005p4-6F
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 16:02:40 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ac351229-5d6d-4efc-9696-5ff9f699ee7c;
 Wed, 04 Nov 2020 16:02:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-4a3h0GbhMgKLAt5Gnfz4pQ-1; Wed, 04 Nov 2020 11:02:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DF88137BC1;
 Wed,  4 Nov 2020 16:01:24 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 604F7277DD;
 Wed,  4 Nov 2020 16:01:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aHic=EK=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
	id 1kaLFA-0005p4-6F
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 16:02:40 +0000
X-Inumbo-ID: ac351229-5d6d-4efc-9696-5ff9f699ee7c
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id ac351229-5d6d-4efc-9696-5ff9f699ee7c;
	Wed, 04 Nov 2020 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604505757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fsQe7Mm1Y7+ujDMAz+Zy/FiKiDElt5mnHtrgipEPHRs=;
	b=ZXNrAXKi2WUKr0L1st/J3I5llCzYd/GVPvct9AYpcDCCz2HcFdV4SHGg3F/vAzl/95bPRi
	el0tq5vTY7tFqW7NoDy04vthx7AewjkIN6+8wOjjYjn4vKIU6Bih7zCS1cKxkPICCndxds
	AJZYu5Cqexw5FtizKAsq1KPW1Sbqa8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-4a3h0GbhMgKLAt5Gnfz4pQ-1; Wed, 04 Nov 2020 11:02:33 -0500
X-MC-Unique: 4a3h0GbhMgKLAt5Gnfz4pQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DF88137BC1;
	Wed,  4 Nov 2020 16:01:24 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 604F7277DD;
	Wed,  4 Nov 2020 16:01:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 09/44] qdev: Make qdev_get_prop_ptr() get Object* arg
Date: Wed,  4 Nov 2020 10:59:46 -0500
Message-Id: <20201104160021.2342108-10-ehabkost@redhat.com>
In-Reply-To: <20201104160021.2342108-1-ehabkost@redhat.com>
References: <20201104160021.2342108-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make the code more generic and not specific to TYPE_DEVICE.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
- Fix build error with CONFIG_XEN
  I took the liberty of keeping the Reviewed-by line from
  Marc-André as the build fix is a trivial one line change
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
Cc: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 include/hw/qdev-properties.h     |  2 +-
 backends/tpm/tpm_util.c          |  8 ++--
 hw/block/xen-block.c             |  5 +-
 hw/core/qdev-properties-system.c | 57 +++++++++-------------
 hw/core/qdev-properties.c        | 82 +++++++++++++-------------------
 hw/s390x/css.c                   |  5 +-
 hw/s390x/s390-pci-bus.c          |  4 +-
 hw/vfio/pci-quirks.c             |  5 +-
 8 files changed, 68 insertions(+), 100 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0ea822e6a7..0b92cfc761 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -302,7 +302,7 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 
-void *qdev_get_prop_ptr(DeviceState *dev, Property *prop);
+void *qdev_get_prop_ptr(Object *obj, Property *prop);
 
 void qdev_prop_register_global(GlobalProperty *prop);
 const GlobalProperty *qdev_find_global_prop(DeviceState *dev,
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index b58d298c1a..e91c21dd4a 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -35,8 +35,7 @@
 static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
-    TPMBackend **be = qdev_get_prop_ptr(dev, opaque);
+    TPMBackend **be = qdev_get_prop_ptr(obj, opaque);
     char *p;
 
     p = g_strdup(*be ? (*be)->id : "");
@@ -49,7 +48,7 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    TPMBackend *s, **be = qdev_get_prop_ptr(dev, prop);
+    TPMBackend *s, **be = qdev_get_prop_ptr(obj, prop);
     char *str;
 
     if (dev->realized) {
@@ -73,9 +72,8 @@ static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
 
 static void release_tpm(Object *obj, const char *name, void *opaque)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    TPMBackend **be = qdev_get_prop_ptr(dev, prop);
+    TPMBackend **be = qdev_get_prop_ptr(obj, prop);
 
     if (*be) {
         tpm_backend_reset(*be);
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 8a7a3f5452..905e4acd97 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -335,9 +335,8 @@ static char *disk_to_vbd_name(unsigned int disk)
 static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    XenBlockVdev *vdev = qdev_get_prop_ptr(dev, prop);
+    XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
     char *str;
 
     switch (vdev->type) {
@@ -398,7 +397,7 @@ static void xen_block_set_vdev(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    XenBlockVdev *vdev = qdev_get_prop_ptr(dev, prop);
+    XenBlockVdev *vdev = qdev_get_prop_ptr(obj, prop);
     char *str, *p;
     const char *end;
 
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index d0fb063a49..c8c73c371b 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -59,9 +59,8 @@ static bool check_prop_still_unset(DeviceState *dev, const char *name,
 static void get_drive(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    void **ptr = qdev_get_prop_ptr(dev, prop);
+    void **ptr = qdev_get_prop_ptr(obj, prop);
     const char *value;
     char *p;
 
@@ -87,7 +86,7 @@ static void set_drive_helper(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    void **ptr = qdev_get_prop_ptr(dev, prop);
+    void **ptr = qdev_get_prop_ptr(obj, prop);
     char *str;
     BlockBackend *blk;
     bool blk_created = false;
@@ -185,7 +184,7 @@ static void release_drive(Object *obj, const char *name, void *opaque)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    BlockBackend **ptr = qdev_get_prop_ptr(dev, prop);
+    BlockBackend **ptr = qdev_get_prop_ptr(obj, prop);
 
     if (*ptr) {
         AioContext *ctx = blk_get_aio_context(*ptr);
@@ -218,8 +217,7 @@ const PropertyInfo qdev_prop_drive_iothread = {
 static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
-    CharBackend *be = qdev_get_prop_ptr(dev, opaque);
+    CharBackend *be = qdev_get_prop_ptr(obj, opaque);
     char *p;
 
     p = g_strdup(be->chr && be->chr->label ? be->chr->label : "");
@@ -232,7 +230,7 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    CharBackend *be = qdev_get_prop_ptr(dev, prop);
+    CharBackend *be = qdev_get_prop_ptr(obj, prop);
     Chardev *s;
     char *str;
 
@@ -272,9 +270,8 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
 
 static void release_chr(Object *obj, const char *name, void *opaque)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    CharBackend *be = qdev_get_prop_ptr(dev, prop);
+    CharBackend *be = qdev_get_prop_ptr(obj, prop);
 
     qemu_chr_fe_deinit(be, false);
 }
@@ -297,9 +294,8 @@ const PropertyInfo qdev_prop_chr = {
 static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    MACAddr *mac = qdev_get_prop_ptr(dev, prop);
+    MACAddr *mac = qdev_get_prop_ptr(obj, prop);
     char buffer[2 * 6 + 5 + 1];
     char *p = buffer;
 
@@ -315,7 +311,7 @@ static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    MACAddr *mac = qdev_get_prop_ptr(dev, prop);
+    MACAddr *mac = qdev_get_prop_ptr(obj, prop);
     int i, pos;
     char *str;
     const char *p;
@@ -381,9 +377,8 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
 static void get_netdev(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    NICPeers *peers_ptr = qdev_get_prop_ptr(dev, prop);
+    NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
     char *p = g_strdup(peers_ptr->ncs[0] ? peers_ptr->ncs[0]->name : "");
 
     visit_type_str(v, name, &p, errp);
@@ -395,7 +390,7 @@ static void set_netdev(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    NICPeers *peers_ptr = qdev_get_prop_ptr(dev, prop);
+    NICPeers *peers_ptr = qdev_get_prop_ptr(obj, prop);
     NetClientState **ncs = peers_ptr->ncs;
     NetClientState *peers[MAX_QUEUE_NUM];
     int queues, err = 0, i = 0;
@@ -461,9 +456,8 @@ const PropertyInfo qdev_prop_netdev = {
 static void get_audiodev(Object *obj, Visitor *v, const char* name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    QEMUSoundCard *card = qdev_get_prop_ptr(dev, prop);
+    QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
     char *p = g_strdup(audio_get_id(card));
 
     visit_type_str(v, name, &p, errp);
@@ -475,7 +469,7 @@ static void set_audiodev(Object *obj, Visitor *v, const char* name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    QEMUSoundCard *card = qdev_get_prop_ptr(dev, prop);
+    QEMUSoundCard *card = qdev_get_prop_ptr(obj, prop);
     AudioState *state;
     int err = 0;
     char *str;
@@ -582,7 +576,7 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
     uint64_t value;
     Error *local_err = NULL;
 
@@ -674,9 +668,8 @@ const PropertyInfo qdev_prop_multifd_compression = {
 static void get_reserved_region(Object *obj, Visitor *v, const char *name,
                                 void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    ReservedRegion *rr = qdev_get_prop_ptr(dev, prop);
+    ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
     char buffer[64];
     char *p = buffer;
     int rc;
@@ -693,7 +686,7 @@ static void set_reserved_region(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    ReservedRegion *rr = qdev_get_prop_ptr(dev, prop);
+    ReservedRegion *rr = qdev_get_prop_ptr(obj, prop);
     Error *local_err = NULL;
     const char *endptr;
     char *str;
@@ -761,7 +754,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int32_t value, *ptr = qdev_get_prop_ptr(dev, prop);
+    int32_t value, *ptr = qdev_get_prop_ptr(obj, prop);
     unsigned int slot, fn, n;
     char *str;
 
@@ -804,8 +797,7 @@ invalid:
 static int print_pci_devfn(Object *obj, Property *prop, char *dest,
                            size_t len)
 {
-    DeviceState *dev = DEVICE(obj);
-    int32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (*ptr == -1) {
         return snprintf(dest, len, "<unset>");
@@ -828,9 +820,8 @@ const PropertyInfo qdev_prop_pci_devfn = {
 static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
+    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
     char buffer[] = "ffff:ff:ff.f";
     char *p = buffer;
     int rc = 0;
@@ -857,7 +848,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
+    PCIHostDeviceAddress *addr = qdev_get_prop_ptr(obj, prop);
     char *str, *p;
     const char *e;
     unsigned long val;
@@ -950,9 +941,8 @@ const PropertyInfo qdev_prop_off_auto_pcibar = {
 static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIExpLinkSpeed *p = qdev_get_prop_ptr(dev, prop);
+    PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
     int speed;
 
     switch (*p) {
@@ -981,7 +971,7 @@ static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIExpLinkSpeed *p = qdev_get_prop_ptr(dev, prop);
+    PCIExpLinkSpeed *p = qdev_get_prop_ptr(obj, prop);
     int speed;
 
     if (dev->realized) {
@@ -1027,9 +1017,8 @@ const PropertyInfo qdev_prop_pcie_link_speed = {
 static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIExpLinkWidth *p = qdev_get_prop_ptr(dev, prop);
+    PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
     int width;
 
     switch (*p) {
@@ -1067,7 +1056,7 @@ static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    PCIExpLinkWidth *p = qdev_get_prop_ptr(dev, prop);
+    PCIExpLinkWidth *p = qdev_get_prop_ptr(obj, prop);
     int width;
 
     if (dev->realized) {
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 3a4638f4de..0a54a922c8 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -38,9 +38,9 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
     }
 }
 
-void *qdev_get_prop_ptr(DeviceState *dev, Property *prop)
+void *qdev_get_prop_ptr(Object *obj, Property *prop)
 {
-    void *ptr = dev;
+    void *ptr = obj;
     ptr += prop->offset;
     return ptr;
 }
@@ -48,9 +48,8 @@ void *qdev_get_prop_ptr(DeviceState *dev, Property *prop)
 void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int *ptr = qdev_get_prop_ptr(dev, prop);
+    int *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
 }
@@ -60,7 +59,7 @@ void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int *ptr = qdev_get_prop_ptr(dev, prop);
+    int *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -94,8 +93,7 @@ static uint32_t qdev_get_prop_mask(Property *prop)
 
 static void bit_prop_set(Object *obj, Property *props, bool val)
 {
-    DeviceState *dev = DEVICE(obj);
-    uint32_t *p = qdev_get_prop_ptr(dev, props);
+    uint32_t *p = qdev_get_prop_ptr(obj, props);
     uint32_t mask = qdev_get_prop_mask(props);
     if (val) {
         *p |= mask;
@@ -107,9 +105,8 @@ static void bit_prop_set(Object *obj, Property *props, bool val)
 static void prop_get_bit(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *p = qdev_get_prop_ptr(dev, prop);
+    uint32_t *p = qdev_get_prop_ptr(obj, prop);
     bool value = (*p & qdev_get_prop_mask(prop)) != 0;
 
     visit_type_bool(v, name, &value, errp);
@@ -156,8 +153,7 @@ static uint64_t qdev_get_prop_mask64(Property *prop)
 
 static void bit64_prop_set(Object *obj, Property *props, bool val)
 {
-    DeviceState *dev = DEVICE(obj);
-    uint64_t *p = qdev_get_prop_ptr(dev, props);
+    uint64_t *p = qdev_get_prop_ptr(obj, props);
     uint64_t mask = qdev_get_prop_mask64(props);
     if (val) {
         *p |= mask;
@@ -169,9 +165,8 @@ static void bit64_prop_set(Object *obj, Property *props, bool val)
 static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *p = qdev_get_prop_ptr(dev, prop);
+    uint64_t *p = qdev_get_prop_ptr(obj, prop);
     bool value = (*p & qdev_get_prop_mask64(prop)) != 0;
 
     visit_type_bool(v, name, &value, errp);
@@ -208,9 +203,8 @@ const PropertyInfo qdev_prop_bit64 = {
 static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    bool *ptr = qdev_get_prop_ptr(dev, prop);
+    bool *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_bool(v, name, ptr, errp);
 }
@@ -220,7 +214,7 @@ static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    bool *ptr = qdev_get_prop_ptr(dev, prop);
+    bool *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -242,9 +236,8 @@ const PropertyInfo qdev_prop_bool = {
 static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
@@ -254,7 +247,7 @@ static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -288,9 +281,8 @@ const PropertyInfo qdev_prop_uint8 = {
 void qdev_propinfo_get_uint16(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint16_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint16(v, name, ptr, errp);
 }
@@ -300,7 +292,7 @@ static void set_uint16(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint16_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint16_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -322,9 +314,8 @@ const PropertyInfo qdev_prop_uint16 = {
 static void get_uint32(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
@@ -334,7 +325,7 @@ static void set_uint32(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -347,9 +338,8 @@ static void set_uint32(Object *obj, Visitor *v, const char *name,
 void qdev_propinfo_get_int32(Object *obj, Visitor *v, const char *name,
                              void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_int32(v, name, ptr, errp);
 }
@@ -359,7 +349,7 @@ static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -388,9 +378,8 @@ const PropertyInfo qdev_prop_int32 = {
 static void get_uint64(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint64(v, name, ptr, errp);
 }
@@ -400,7 +389,7 @@ static void set_uint64(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -413,9 +402,8 @@ static void set_uint64(Object *obj, Visitor *v, const char *name,
 static void get_int64(Object *obj, Visitor *v, const char *name,
                       void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_int64(v, name, ptr, errp);
 }
@@ -425,7 +413,7 @@ static void set_int64(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    int64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    int64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -454,15 +442,14 @@ const PropertyInfo qdev_prop_int64 = {
 static void release_string(Object *obj, const char *name, void *opaque)
 {
     Property *prop = opaque;
-    g_free(*(char **)qdev_get_prop_ptr(DEVICE(obj), prop));
+    g_free(*(char **)qdev_get_prop_ptr(obj, prop));
 }
 
 static void get_string(Object *obj, Visitor *v, const char *name,
                        void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    char **ptr = qdev_get_prop_ptr(dev, prop);
+    char **ptr = qdev_get_prop_ptr(obj, prop);
 
     if (!*ptr) {
         char *str = (char *)"";
@@ -477,7 +464,7 @@ static void set_string(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    char **ptr = qdev_get_prop_ptr(dev, prop);
+    char **ptr = qdev_get_prop_ptr(obj, prop);
     char *str;
 
     if (dev->realized) {
@@ -515,9 +502,8 @@ const PropertyInfo qdev_prop_on_off_auto = {
 void qdev_propinfo_get_size32(Object *obj, Visitor *v, const char *name,
                               void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
     uint64_t value = *ptr;
 
     visit_type_size(v, name, &value, errp);
@@ -528,7 +514,7 @@ static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
     uint64_t value;
 
     if (dev->realized) {
@@ -563,9 +549,8 @@ const PropertyInfo qdev_prop_size32 = {
 static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    QemuUUID *uuid = qdev_get_prop_ptr(dev, prop);
+    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
     char buffer[UUID_FMT_LEN + 1];
     char *p = buffer;
 
@@ -581,7 +566,7 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    QemuUUID *uuid = qdev_get_prop_ptr(dev, prop);
+    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
     char *str;
 
     if (dev->realized) {
@@ -653,7 +638,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
      */
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *alenptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *alenptr = qdev_get_prop_ptr(obj, prop);
     void **arrayptr = (void *)dev + prop->arrayoffset;
     void *eltptr;
     const char *arrayname;
@@ -699,7 +684,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
          * being inside the device struct.
          */
         arrayprop->prop.offset = eltptr - (void *)dev;
-        assert(qdev_get_prop_ptr(dev, &arrayprop->prop) == eltptr);
+        assert(qdev_get_prop_ptr(obj, &arrayprop->prop) == eltptr);
         object_property_add(obj, propname,
                             arrayprop->prop.info->name,
                             arrayprop->prop.info->get,
@@ -893,9 +878,8 @@ void qdev_prop_set_globals(DeviceState *dev)
 static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
                      Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_size(v, name, ptr, errp);
 }
@@ -905,7 +889,7 @@ static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint64_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 9961cfe7bf..2b8f33fec2 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2343,9 +2343,8 @@ void css_reset(void)
 static void get_css_devid(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    CssDevId *dev_id = qdev_get_prop_ptr(dev, prop);
+    CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
     char buffer[] = "xx.x.xxxx";
     char *p = buffer;
     int r;
@@ -2375,7 +2374,7 @@ static void set_css_devid(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    CssDevId *dev_id = qdev_get_prop_ptr(dev, prop);
+    CssDevId *dev_id = qdev_get_prop_ptr(obj, prop);
     char *str;
     int num, n1, n2;
     unsigned int cssid, ssid, devid;
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 48a3be802f..ab27b6e848 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1323,7 +1323,7 @@ static void s390_pci_get_fid(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(DEVICE(obj), prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
@@ -1334,7 +1334,7 @@ static void s390_pci_set_fid(Object *obj, Visitor *v, const char *name,
     DeviceState *dev = DEVICE(obj);
     S390PCIBusDevice *zpci = S390_PCI_DEVICE(obj);
     Property *prop = opaque;
-    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index 57150913b7..53569925a2 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1488,9 +1488,8 @@ static void get_nv_gpudirect_clique_id(Object *obj, Visitor *v,
                                        const char *name, void *opaque,
                                        Error **errp)
 {
-    DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint8_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint8_t *ptr = qdev_get_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
@@ -1501,7 +1500,7 @@ static void set_nv_gpudirect_clique_id(Object *obj, Visitor *v,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint8_t value, *ptr = qdev_get_prop_ptr(dev, prop);
+    uint8_t value, *ptr = qdev_get_prop_ptr(obj, prop);
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
-- 
2.28.0


