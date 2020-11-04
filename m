Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF32A6B97
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 18:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19440.44641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaMXW-0004yo-VT; Wed, 04 Nov 2020 17:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19440.44641; Wed, 04 Nov 2020 17:25:42 +0000
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
	id 1kaMXW-0004yP-Ra; Wed, 04 Nov 2020 17:25:42 +0000
Received: by outflank-mailman (input) for mailman id 19440;
 Wed, 04 Nov 2020 17:25:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aHic=EK=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kaMXV-0004yK-0m
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 17:25:41 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 38d4fb6b-17e7-4f7b-aae3-b74dfee7aad7;
 Wed, 04 Nov 2020 17:25:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-BliftGsjOkqSm4-6LQDSYg-1; Wed, 04 Nov 2020 12:25:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 488668049CB;
 Wed,  4 Nov 2020 17:25:29 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A6315C5DE;
 Wed,  4 Nov 2020 17:25:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aHic=EK=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
	id 1kaMXV-0004yK-0m
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 17:25:41 +0000
X-Inumbo-ID: 38d4fb6b-17e7-4f7b-aae3-b74dfee7aad7
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 38d4fb6b-17e7-4f7b-aae3-b74dfee7aad7;
	Wed, 04 Nov 2020 17:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604510736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qH+Ft2xr8oMmaql/QpsL3d2WQdY3tolquMseQzbcMBo=;
	b=Q6SJsWvvVfwUxbPJ+GeFpNT1OqX3Ek8gG8m/Ht3CmiDLQLp/3+MtklHRZb6U0sJOVQBGB8
	udaOPbtYX1035iDVckbRvArURWgq/hT4y9g2wLOKgAQXywtHMj1T2GeSuOohlZkFG+lldH
	LjX9mW8VV1wm5uc+/J4q3/jNz8xq9UI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-BliftGsjOkqSm4-6LQDSYg-1; Wed, 04 Nov 2020 12:25:31 -0500
X-MC-Unique: BliftGsjOkqSm4-6LQDSYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 488668049CB;
	Wed,  4 Nov 2020 17:25:29 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A6315C5DE;
	Wed,  4 Nov 2020 17:25:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 4/7] qom: Replace void* parameter with Property* on field getters/setters
Date: Wed,  4 Nov 2020 12:25:09 -0500
Message-Id: <20201104172512.2381656-5-ehabkost@redhat.com>
In-Reply-To: <20201104172512.2381656-1-ehabkost@redhat.com>
References: <20201104172512.2381656-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All field property getters and setters must interpret the fourth
argument as Property*.  Change the function signature of field
property getters and setters to indicate that.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
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
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-block@nongnu.org
Cc: qemu-s390x@nongnu.org
---
 include/qom/field-property-internal.h |   8 +-
 include/qom/field-property.h          |  26 ++++---
 backends/tpm/tpm_util.c               |  11 ++-
 hw/block/xen-block.c                  |   6 +-
 hw/core/qdev-properties-system.c      |  86 +++++++++-------------
 hw/s390x/css.c                        |   6 +-
 hw/s390x/s390-pci-bus.c               |   6 +-
 hw/vfio/pci-quirks.c                  |  10 +--
 qom/property-types.c                  | 102 +++++++++-----------------
 target/sparc/cpu.c                    |   4 +-
 10 files changed, 105 insertions(+), 160 deletions(-)

diff --git a/include/qom/field-property-internal.h b/include/qom/field-property-internal.h
index 7aa27ce836..bc7d25033d 100644
--- a/include/qom/field-property-internal.h
+++ b/include/qom/field-property-internal.h
@@ -9,9 +9,9 @@
 #define QOM_STATIC_PROPERTY_INTERNAL_H
 
 void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp);
+                         Property *prop, Error **errp);
 void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp);
+                         Property *prop, Error **errp);
 
 void field_prop_set_default_value_enum(ObjectProperty *op,
                                        const Property *prop);
@@ -21,9 +21,9 @@ void field_prop_set_default_value_uint(ObjectProperty *op,
                                        const Property *prop);
 
 void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
-                          void *opaque, Error **errp);
+                          Property *prop, Error **errp);
 void field_prop_get_size32(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp);
+                           Property *prop, Error **errp);
 
 /**
  * object_property_add_field: Add a field property to an object instance
diff --git a/include/qom/field-property.h b/include/qom/field-property.h
index e64a2b3c07..438bb25896 100644
--- a/include/qom/field-property.h
+++ b/include/qom/field-property.h
@@ -54,6 +54,18 @@ struct Property {
     const char   *link_type;
 };
 
+/**
+ * typedef FieldAccessor: a field property getter or setter function
+ * @obj: the object instance
+ * @v: the visitor that contains the property data
+ * @name: the name of the property
+ * @prop: Field property definition
+ * @errp: pointer to error information
+ */
+typedef void FieldAccessor(Object *obj, Visitor *v,
+                           const char *name, Property *prop,
+                           Error **errp);
+
 /**
  * struct PropertyInfo: information on a specific QOM property type
  */
@@ -71,16 +83,10 @@ struct PropertyInfo {
     /** @create: Optional callback for creation of property */
     ObjectProperty *(*create)(ObjectClass *oc, const char *name,
                               Property *prop);
-    /**
-     * @get: Property getter.  The opaque parameter will point to
-     *        the &Property struct for the property.
-     */
-    ObjectPropertyAccessor *get;
-    /**
-     * @set: Property setter.  The opaque parameter will point to
-     *        the &Property struct for the property.
-     */
-    ObjectPropertyAccessor *set;
+    /** @get: Property getter */
+    FieldAccessor *get;
+    /** @set: Property setter */
+    FieldAccessor *set;
     /**
      * @release: Optional release function, called when the object
      * is destroyed
diff --git a/backends/tpm/tpm_util.c b/backends/tpm/tpm_util.c
index bb1ab34a75..e8837938e5 100644
--- a/backends/tpm/tpm_util.c
+++ b/backends/tpm/tpm_util.c
@@ -32,10 +32,10 @@
 
 /* tpm backend property */
 
-static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
-                    Error **errp)
+static void get_tpm(Object *obj, Visitor *v, const char *name,
+                    Property *prop, Error **errp)
 {
-    TPMBackend **be = object_field_prop_ptr(obj, opaque);
+    TPMBackend **be = object_field_prop_ptr(obj, prop);
     char *p;
 
     p = g_strdup(*be ? (*be)->id : "");
@@ -43,10 +43,9 @@ static void get_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
     g_free(p);
 }
 
-static void set_tpm(Object *obj, Visitor *v, const char *name, void *opaque,
-                    Error **errp)
+static void set_tpm(Object *obj, Visitor *v, const char *name,
+                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     TPMBackend *s, **be = object_field_prop_ptr(obj, prop);
     char *str;
 
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 718d886e5c..c1ee634639 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -333,9 +333,8 @@ static char *disk_to_vbd_name(unsigned int disk)
 }
 
 static void xen_block_get_vdev(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+                                Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     XenBlockVdev *vdev = object_field_prop_ptr(obj, prop);
     char *str;
 
@@ -393,9 +392,8 @@ static int vbd_name_to_disk(const char *name, const char **endp,
 }
 
 static void xen_block_set_vdev(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+                                Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     XenBlockVdev *vdev = object_field_prop_ptr(obj, prop);
     char *str, *p;
     const char *end;
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 8da68f076c..4c649cb4b2 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -58,10 +58,9 @@ static bool check_prop_still_unset(Object *obj, const char *name,
 
 /* --- drive --- */
 
-static void get_drive(Object *obj, Visitor *v, const char *name, void *opaque,
-                      Error **errp)
+static void get_drive(Object *obj, Visitor *v, const char *name,
+                      Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     void **ptr = object_field_prop_ptr(obj, prop);
     const char *value;
     char *p;
@@ -165,16 +164,16 @@ fail:
     g_free(str);
 }
 
-static void set_drive(Object *obj, Visitor *v, const char *name, void *opaque,
+static void set_drive(Object *obj, Visitor *v, const char *name, Property *prop,
                       Error **errp)
 {
-    set_drive_helper(obj, v, name, opaque, false, errp);
+    set_drive_helper(obj, v, name, prop, false, errp);
 }
 
 static void set_drive_iothread(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+                               Property *prop, Error **errp)
 {
-    set_drive_helper(obj, v, name, opaque, true, errp);
+    set_drive_helper(obj, v, name, prop, true, errp);
 }
 
 static void release_drive(Object *obj, const char *name, void *opaque)
@@ -211,10 +210,10 @@ const PropertyInfo qdev_prop_drive_iothread = {
 
 /* --- character device --- */
 
-static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
-                    Error **errp)
+static void get_chr(Object *obj, Visitor *v, const char *name,
+                    Property *prop, Error **errp)
 {
-    CharBackend *be = object_field_prop_ptr(obj, opaque);
+    CharBackend *be = object_field_prop_ptr(obj, prop);
     char *p;
 
     p = g_strdup(be->chr && be->chr->label ? be->chr->label : "");
@@ -222,10 +221,9 @@ static void get_chr(Object *obj, Visitor *v, const char *name, void *opaque,
     g_free(p);
 }
 
-static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
-                    Error **errp)
+static void set_chr(Object *obj, Visitor *v, const char *name,
+                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     CharBackend *be = object_field_prop_ptr(obj, prop);
     Chardev *s;
     char *str;
@@ -282,10 +280,9 @@ const PropertyInfo qdev_prop_chr = {
  *   01:02:03:04:05:06
  *   01-02-03-04-05-06
  */
-static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
-                    Error **errp)
+static void get_mac(Object *obj, Visitor *v, const char *name,
+                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     MACAddr *mac = object_field_prop_ptr(obj, prop);
     char buffer[2 * 6 + 5 + 1];
     char *p = buffer;
@@ -297,10 +294,9 @@ static void get_mac(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_str(v, name, &p, errp);
 }
 
-static void set_mac(Object *obj, Visitor *v, const char *name, void *opaque,
-                    Error **errp)
+static void set_mac(Object *obj, Visitor *v, const char *name,
+                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     MACAddr *mac = object_field_prop_ptr(obj, prop);
     int i, pos;
     char *str;
@@ -360,9 +356,8 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
 
 /* --- netdev device --- */
 static void get_netdev(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     NICPeers *peers_ptr = object_field_prop_ptr(obj, prop);
     char *p = g_strdup(peers_ptr->ncs[0] ? peers_ptr->ncs[0]->name : "");
 
@@ -371,9 +366,8 @@ static void get_netdev(Object *obj, Visitor *v, const char *name,
 }
 
 static void set_netdev(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     NICPeers *peers_ptr = object_field_prop_ptr(obj, prop);
     NetClientState **ncs = peers_ptr->ncs;
     NetClientState *peers[MAX_QUEUE_NUM];
@@ -433,9 +427,8 @@ const PropertyInfo qdev_prop_netdev = {
 
 /* --- audiodev --- */
 static void get_audiodev(Object *obj, Visitor *v, const char* name,
-                         void *opaque, Error **errp)
+                          Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     QEMUSoundCard *card = object_field_prop_ptr(obj, prop);
     char *p = g_strdup(audio_get_id(card));
 
@@ -444,9 +437,8 @@ static void get_audiodev(Object *obj, Visitor *v, const char* name,
 }
 
 static void set_audiodev(Object *obj, Visitor *v, const char* name,
-                         void *opaque, Error **errp)
+                          Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     QEMUSoundCard *card = object_field_prop_ptr(obj, prop);
     AudioState *state;
     int err = 0;
@@ -545,10 +537,9 @@ const PropertyInfo qdev_prop_losttickpolicy = {
 /* --- blocksize --- */
 
 static void set_blocksize(Object *obj, Visitor *v, const char *name,
-                          void *opaque, Error **errp)
+                           Property *prop, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
-    Property *prop = opaque;
     uint32_t *ptr = object_field_prop_ptr(obj, prop);
     uint64_t value;
     Error *local_err = NULL;
@@ -634,9 +625,8 @@ const PropertyInfo qdev_prop_multifd_compression = {
  *   and type is a non-negative decimal integer
  */
 static void get_reserved_region(Object *obj, Visitor *v, const char *name,
-                                void *opaque, Error **errp)
+                                 Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     ReservedRegion *rr = object_field_prop_ptr(obj, prop);
     char buffer[64];
     char *p = buffer;
@@ -650,9 +640,8 @@ static void get_reserved_region(Object *obj, Visitor *v, const char *name,
 }
 
 static void set_reserved_region(Object *obj, Visitor *v, const char *name,
-                                void *opaque, Error **errp)
+                                 Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     ReservedRegion *rr = object_field_prop_ptr(obj, prop);
     Error *local_err = NULL;
     const char *endptr;
@@ -712,9 +701,8 @@ const PropertyInfo qdev_prop_reserved_region = {
  * bus-local address, i.e. "$slot" or "$slot.$fn"
  */
 static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
-                          void *opaque, Error **errp)
+                           Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     int32_t value, *ptr = object_field_prop_ptr(obj, prop);
     unsigned int slot, fn, n;
     char *str;
@@ -774,9 +762,8 @@ const PropertyInfo qdev_prop_pci_devfn = {
 /* --- pci host address --- */
 
 static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
-                                 void *opaque, Error **errp)
+                                  Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     PCIHostDeviceAddress *addr = object_field_prop_ptr(obj, prop);
     char buffer[] = "ffff:ff:ff.f";
     char *p = buffer;
@@ -800,9 +787,8 @@ static void get_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
  *   if <domain> is not supplied, it's assumed to be 0.
  */
 static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
-                                 void *opaque, Error **errp)
+                                  Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     PCIHostDeviceAddress *addr = object_field_prop_ptr(obj, prop);
     char *str, *p;
     const char *e;
@@ -889,9 +875,8 @@ const PropertyInfo qdev_prop_off_auto_pcibar = {
 /* --- PCIELinkSpeed 2_5/5/8/16 -- */
 
 static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+                                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     PCIExpLinkSpeed *p = object_field_prop_ptr(obj, prop);
     int speed;
 
@@ -917,9 +902,8 @@ static void get_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
 }
 
 static void set_prop_pcielinkspeed(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+                                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     PCIExpLinkSpeed *p = object_field_prop_ptr(obj, prop);
     int speed;
 
@@ -959,9 +943,8 @@ const PropertyInfo qdev_prop_pcie_link_speed = {
 /* --- PCIELinkWidth 1/2/4/8/12/16/32 -- */
 
 static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+                                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     PCIExpLinkWidth *p = object_field_prop_ptr(obj, prop);
     int width;
 
@@ -996,9 +979,8 @@ static void get_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
 }
 
 static void set_prop_pcielinkwidth(Object *obj, Visitor *v, const char *name,
-                                   void *opaque, Error **errp)
+                                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     PCIExpLinkWidth *p = object_field_prop_ptr(obj, prop);
     int width;
 
@@ -1046,10 +1028,9 @@ const PropertyInfo qdev_prop_pcie_link_width = {
 
 /* --- UUID --- */
 
-static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
+static void get_uuid(Object *obj, Visitor *v, const char *name,
+                     Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     QemuUUID *uuid = object_field_prop_ptr(obj, prop);
     char buffer[UUID_FMT_LEN + 1];
     char *p = buffer;
@@ -1061,10 +1042,9 @@ static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
 
 #define UUID_VALUE_AUTO        "auto"
 
-static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
-                    Error **errp)
+static void set_uuid(Object *obj, Visitor *v, const char *name,
+                    Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     QemuUUID *uuid = object_field_prop_ptr(obj, prop);
     char *str;
 
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index fe47751df4..1400d80689 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -2341,9 +2341,8 @@ void css_reset(void)
 }
 
 static void get_css_devid(Object *obj, Visitor *v, const char *name,
-                          void *opaque, Error **errp)
+                           Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     CssDevId *dev_id = object_field_prop_ptr(obj, prop);
     char buffer[] = "xx.x.xxxx";
     char *p = buffer;
@@ -2370,9 +2369,8 @@ static void get_css_devid(Object *obj, Visitor *v, const char *name,
  * parse <cssid>.<ssid>.<devid> and assert valid range for cssid/ssid
  */
 static void set_css_devid(Object *obj, Visitor *v, const char *name,
-                          void *opaque, Error **errp)
+                           Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     CssDevId *dev_id = object_field_prop_ptr(obj, prop);
     char *str;
     int num, n1, n2;
diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 99b18d56ba..a29bba17b4 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1320,19 +1320,17 @@ static void s390_pci_device_reset(DeviceState *dev)
 }
 
 static void s390_pci_get_fid(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
+                          Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
 
 static void s390_pci_set_fid(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
+                          Property *prop, Error **errp)
 {
     S390PCIBusDevice *zpci = S390_PCI_DEVICE(obj);
-    Property *prop = opaque;
     uint32_t *ptr = object_field_prop_ptr(obj, prop);
 
     if (!visit_type_uint32(v, name, ptr, errp)) {
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index fc8d63c850..34f5f5dce2 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -1485,20 +1485,18 @@ void vfio_setup_resetfn_quirk(VFIOPCIDevice *vdev)
  * https://lists.gnu.org/archive/html/qemu-devel/2017-08/pdfUda5iEpgOS.pdf
  */
 static void get_nv_gpudirect_clique_id(Object *obj, Visitor *v,
-                                       const char *name, void *opaque,
-                                       Error **errp)
+                                       const char *name,
+                                       Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint8_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
 
 static void set_nv_gpudirect_clique_id(Object *obj, Visitor *v,
-                                       const char *name, void *opaque,
-                                       Error **errp)
+                                       const char *name,
+                                       Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint8_t value, *ptr = object_field_prop_ptr(obj, prop);
 
     if (!visit_type_uint8(v, name, &value, errp)) {
diff --git a/qom/property-types.c b/qom/property-types.c
index 856b5ae76d..82a5932f4a 100644
--- a/qom/property-types.c
+++ b/qom/property-types.c
@@ -8,18 +8,16 @@
 #include "qemu/uuid.h"
 
 void field_prop_get_enum(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
+                          Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     int *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
 }
 
 void field_prop_set_enum(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
+                          Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     int *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_enum(v, name, ptr, prop->info->enum_table, errp);
@@ -59,9 +57,8 @@ static void bit_prop_set(Object *obj, Property *props, bool val)
 }
 
 static void prop_get_bit(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
+                          Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint32_t *p = object_field_prop_ptr(obj, prop);
     bool value = (*p & qdev_get_prop_mask(prop)) != 0;
 
@@ -69,9 +66,8 @@ static void prop_get_bit(Object *obj, Visitor *v, const char *name,
 }
 
 static void prop_set_bit(Object *obj, Visitor *v, const char *name,
-                         void *opaque, Error **errp)
+                          Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     bool value;
 
     if (!visit_type_bool(v, name, &value, errp)) {
@@ -113,9 +109,8 @@ static void bit64_prop_set(Object *obj, Property *props, bool val)
 }
 
 static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
+                            Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint64_t *p = object_field_prop_ptr(obj, prop);
     bool value = (*p & qdev_get_prop_mask64(prop)) != 0;
 
@@ -123,9 +118,8 @@ static void prop_get_bit64(Object *obj, Visitor *v, const char *name,
 }
 
 static void prop_set_bit64(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
+                            Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     bool value;
 
     if (!visit_type_bool(v, name, &value, errp)) {
@@ -144,19 +138,17 @@ const PropertyInfo prop_info_bit64 = {
 
 /* --- bool --- */
 
-static void get_bool(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
+static void get_bool(Object *obj, Visitor *v, const char *name,
+                     Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     bool *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_bool(v, name, ptr, errp);
 }
 
-static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
+static void set_bool(Object *obj, Visitor *v, const char *name,
+                     Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     bool *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_bool(v, name, ptr, errp);
@@ -171,19 +163,17 @@ const PropertyInfo prop_info_bool = {
 
 /* --- 8bit integer --- */
 
-static void get_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
-                      Error **errp)
+static void get_uint8(Object *obj, Visitor *v, const char *name,
+                      Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint8_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
 }
 
-static void set_uint8(Object *obj, Visitor *v, const char *name, void *opaque,
-                      Error **errp)
+static void set_uint8(Object *obj, Visitor *v, const char *name,
+                      Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint8_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint8(v, name, ptr, errp);
@@ -211,18 +201,16 @@ const PropertyInfo prop_info_uint8 = {
 /* --- 16bit integer --- */
 
 static void get_uint16(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint16_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint16(v, name, ptr, errp);
 }
 
 static void set_uint16(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint16_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint16(v, name, ptr, errp);
@@ -238,36 +226,32 @@ const PropertyInfo prop_info_uint16 = {
 /* --- 32bit integer --- */
 
 static void get_uint32(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
 
 static void set_uint32(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint32(v, name, ptr, errp);
 }
 
 void field_prop_get_int32(Object *obj, Visitor *v, const char *name,
-                          void *opaque, Error **errp)
+                           Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     int32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_int32(v, name, ptr, errp);
 }
 
-static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
-                      Error **errp)
+static void set_int32(Object *obj, Visitor *v, const char *name,
+                      Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     int32_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_int32(v, name, ptr, errp);
@@ -290,36 +274,32 @@ const PropertyInfo prop_info_int32 = {
 /* --- 64bit integer --- */
 
 static void get_uint64(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint64(v, name, ptr, errp);
 }
 
 static void set_uint64(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_uint64(v, name, ptr, errp);
 }
 
 static void get_int64(Object *obj, Visitor *v, const char *name,
-                      void *opaque, Error **errp)
+                       Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     int64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_int64(v, name, ptr, errp);
 }
 
 static void set_int64(Object *obj, Visitor *v, const char *name,
-                      void *opaque, Error **errp)
+                       Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     int64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_int64(v, name, ptr, errp);
@@ -348,9 +328,8 @@ static void release_string(Object *obj, const char *name, void *opaque)
 }
 
 static void get_string(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     char **ptr = object_field_prop_ptr(obj, prop);
 
     if (!*ptr) {
@@ -362,9 +341,8 @@ static void get_string(Object *obj, Visitor *v, const char *name,
 }
 
 static void set_string(Object *obj, Visitor *v, const char *name,
-                       void *opaque, Error **errp)
+                        Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     char **ptr = object_field_prop_ptr(obj, prop);
     char *str;
 
@@ -396,19 +374,17 @@ const PropertyInfo prop_info_on_off_auto = {
 /* --- 32bit unsigned int 'size' type --- */
 
 void field_prop_get_size32(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
+                            Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint32_t *ptr = object_field_prop_ptr(obj, prop);
     uint64_t value = *ptr;
 
     visit_type_size(v, name, &value, errp);
 }
 
-static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
-                       Error **errp)
+static void set_size32(Object *obj, Visitor *v, const char *name,
+                       Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint32_t *ptr = object_field_prop_ptr(obj, prop);
     uint64_t value;
 
@@ -437,14 +413,8 @@ const PropertyInfo prop_info_size32 = {
 /* --- support for array properties --- */
 
 static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
-                              void *opaque, Error **errp)
+                               Property *prop, Error **errp)
 {
-    /* Setter for the property which defines the length of a
-     * variable-sized property array. As well as actually setting the
-     * array-length field in the device struct, we have to create the
-     * array itself and dynamically add the corresponding properties.
-     */
-    Property *prop = opaque;
     ObjectProperty *op = object_property_find_err(obj, name, &error_abort);
     uint32_t *alenptr = object_field_prop_ptr(obj, prop);
     void **arrayptr = (void *)obj + prop->arrayoffset;
@@ -500,19 +470,17 @@ const PropertyInfo prop_info_arraylen = {
 
 /* --- 64bit unsigned int 'size' type --- */
 
-static void get_size(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
+static void get_size(Object *obj, Visitor *v, const char *name,
+                     Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_size(v, name, ptr, errp);
 }
 
-static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
+static void set_size(Object *obj, Visitor *v, const char *name,
+                     Property *prop, Error **errp)
 {
-    Property *prop = opaque;
     uint64_t *ptr = object_field_prop_ptr(obj, prop);
 
     visit_type_size(v, name, ptr, errp);
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 5a9397f19a..3acc99c29c 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -787,7 +787,7 @@ static void sparc_cpu_initfn(Object *obj)
 }
 
 static void sparc_get_nwindows(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+                               Property *prop, Error **errp)
 {
     SPARCCPU *cpu = SPARC_CPU(obj);
     int64_t value = cpu->env.def.nwindows;
@@ -796,7 +796,7 @@ static void sparc_get_nwindows(Object *obj, Visitor *v, const char *name,
 }
 
 static void sparc_set_nwindows(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
+                               Property *prop, Error **errp)
 {
     const int64_t min = MIN_NWINDOWS;
     const int64_t max = MAX_NWINDOWS;
-- 
2.28.0


