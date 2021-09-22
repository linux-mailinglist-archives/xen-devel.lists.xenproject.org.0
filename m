Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED79241524E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 23:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193047.343858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9N8-0008JR-AS; Wed, 22 Sep 2021 21:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193047.343858; Wed, 22 Sep 2021 21:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9N8-0008HY-7B; Wed, 22 Sep 2021 21:01:42 +0000
Received: by outflank-mailman (input) for mailman id 193047;
 Wed, 22 Sep 2021 21:01:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6HN=OM=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mT9N6-0008HS-B9
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 21:01:40 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 470d8a7a-1be8-11ec-b9df-12813bfff9fa;
 Wed, 22 Sep 2021 21:01:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8859E21EC6;
 Wed, 22 Sep 2021 16:15:52 +0000 (UTC)
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
X-Inumbo-ID: 470d8a7a-1be8-11ec-b9df-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AlcBA0wPhQv7JVjfEB3jyBVlLhydcLHLk7mWNQnkSaw=;
	b=aNbmKAB3upukJdcXcsuRvB4jG/XeAjvN01JCf7FZfNOuG3Ym0/T3VOHAsNgbv3CyONvpfS
	mid9Yf6nHZMIKJQ8tXxHLaDcTTsVZesJe5TCDt+J3rfnHcViEzutj1BAJythr3C13zB3oI
	zK53p1V+hpk5h2HvFJykoc2d/cYBPPw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <ani@anisinha.ca>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org,
	mark.burton@greensocs.com,
	mirela.grujic@greensocs.com,
	edgari@xilinx.com,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v2 07/16] hw/core/machine: add machine_class_is_dynamic_sysbus_dev_allowed
Date: Wed, 22 Sep 2021 18:13:56 +0200
Message-Id: <20210922161405.140018-8-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

Right now the allowance check for adding a sysbus device using
-device cli option (or device_add qmp command) is done well after
the device has been created. It is done during the machine init done
notifier: machine_init_notify() in hw/core/machine.c

This new function will allow us to check if a sysbus device type is
allowed to be dynamically created by the machine during the device
creation time.

Also make device_is_dynamic_sysbus() use the new function.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

In the context of our series, we need to be able to do the check at
device creation time to allow doing it depending on the current
MACHINE_INIT phase.
---
 include/hw/boards.h | 17 +++++++++++++++++
 hw/core/machine.c   | 15 ++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 463a5514f9..934443c1cd 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -51,6 +51,23 @@ void machine_set_cpu_numa_node(MachineState *machine,
  */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 
+/**
+ * machine_class_is_dynamic_sysbus_dev_allowed: Check if type is an allowed
+ * sysbus device type for the machine class.
+ * @mc: Machine class
+ * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ *
+ * Returns: true if @type is a type in the machine's list of
+ * dynamically pluggable sysbus devices; otherwise false.
+ *
+ * Check if the QOM type @type is in the list of allowed sysbus device
+ * types (see machine_class_allowed_dynamic_sysbus_dev()).
+ * Note that if @type is a subtype of a type which is in the list, it is
+ * allowed too.
+ */
+bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
+                                                 const char *type);
+
 /**
  * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
  * @mc: Machine class
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9125c9aad0..1a18912dc8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -545,18 +545,27 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 
 bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
 {
-    bool allowed = false;
-    strList *wl;
     Object *obj = OBJECT(dev);
 
     if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
         return false;
     }
 
+    return machine_class_is_dynamic_sysbus_dev_allowed(mc,
+            object_get_typename(obj));
+}
+
+bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
+                                                 const char *type)
+{
+    bool allowed = false;
+    strList *wl;
+    ObjectClass *klass = object_class_by_name(type);
+
     for (wl = mc->allowed_dynamic_sysbus_devices;
          !allowed && wl;
          wl = wl->next) {
-        allowed |= !!object_dynamic_cast(obj, wl->value);
+        allowed |= !!object_class_dynamic_cast(klass, wl->value);
     }
 
     return allowed;
-- 
2.33.0


