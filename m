Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA54153D8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 01:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193164.344076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBYh-0000O1-21; Wed, 22 Sep 2021 23:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193164.344076; Wed, 22 Sep 2021 23:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBYg-0000Gu-QU; Wed, 22 Sep 2021 23:21:46 +0000
Received: by outflank-mailman (input) for mailman id 193164;
 Wed, 22 Sep 2021 23:21:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6HN=OM=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTBYe-000855-JW
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 23:21:44 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 469b1cce-97d8-456d-bb97-7342932611b2;
 Wed, 22 Sep 2021 23:21:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id B455E21ED2;
 Wed, 22 Sep 2021 16:15:59 +0000 (UTC)
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
X-Inumbo-ID: 469b1cce-97d8-456d-bb97-7342932611b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfebBfH6GVdfSl+a3M3Z0yLytuwrCU0s61tJ+ZXVGyA=;
	b=4+57fmZZrqqfiMZEPQV/HtYezQjVslO9aiAmXDY9Q9U4w+pBohuF9d/PLrpAJIwjoBNO49
	4DN2/DjmOHhL4T4VsHSwLEPNnD/2srj0nVTR7h5YqWSOh3iImVQU3JbPlA8mSUE2Ei2E1r
	K/SqfsawzVu+ASUu//lxvgY7OHHBmXc=
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
Subject: [RFC PATCH v2 13/16] hw/mem/system-memory: add a memory sysbus device
Date: Wed, 22 Sep 2021 18:14:02 +0200
Message-Id: <20210922161405.140018-14-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

This device can be used to create some memories using standard
device_add qmp command.

This device has one property 'readonly' which allows
to choose between a ram or a rom.
The device holds the adequate memory region and can be put on
the sysbus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Should we add a related CONFIG_ variable in the build system ?

Depending on the chosen condition to add a device, the commit may
change.
---
 include/hw/mem/sysbus-memory.h | 32 +++++++++++++
 hw/mem/sysbus-memory.c         | 83 ++++++++++++++++++++++++++++++++++
 hw/mem/meson.build             |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 include/hw/mem/sysbus-memory.h
 create mode 100644 hw/mem/sysbus-memory.c

diff --git a/include/hw/mem/sysbus-memory.h b/include/hw/mem/sysbus-memory.h
new file mode 100644
index 0000000000..3e1271dbfd
--- /dev/null
+++ b/include/hw/mem/sysbus-memory.h
@@ -0,0 +1,32 @@
+/*
+ * QEMU memory SysBusDevice
+ *
+ * Copyright (c) 2021 Greensocs
+ *
+ * Author:
+ * + Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_SYSBUS_MEMORY_H
+#define HW_SYSBUS_MEMORY_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_SYSBUS_MEMORY "sysbus-memory"
+OBJECT_DECLARE_SIMPLE_TYPE(SysBusMemoryState, SYSBUS_MEMORY)
+
+struct SysBusMemoryState {
+    /* <private> */
+    SysBusDevice parent_obj;
+    uint64_t size;
+    bool readonly;
+
+    /* <public> */
+    MemoryRegion mem;
+};
+
+#endif /* HW_SYSBUS_MEMORY_H */
diff --git a/hw/mem/sysbus-memory.c b/hw/mem/sysbus-memory.c
new file mode 100644
index 0000000000..897fa154f0
--- /dev/null
+++ b/hw/mem/sysbus-memory.c
@@ -0,0 +1,83 @@
+/*
+ * QEMU memory SysBusDevice
+ *
+ * Copyright (c) 2021 Greensocs
+ *
+ * Author:
+ * + Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/mem/sysbus-memory.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+
+static Property sysbus_memory_properties[] = {
+    DEFINE_PROP_UINT64("size", SysBusMemoryState, size, 0),
+    DEFINE_PROP_BOOL("readonly", SysBusMemoryState, readonly, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sysbus_memory_realize(DeviceState *dev, Error **errp)
+{
+    SysBusMemoryState *s = SYSBUS_MEMORY(dev);
+    gchar *name;
+
+    if (!s->size) {
+        error_setg(errp, "'size' must be non-zero.");
+        return;
+    }
+
+    /*
+     * We impose having an id (which is unique) because we need to generate
+     * a unique name for the memory region.
+     * memory_region_init_ram/rom() will abort() (in qemu_ram_set_idstr()
+     * function if 2 system-memory devices are created with the same name
+     * for the memory region).
+     */
+    if (!dev->id) {
+        error_setg(errp, "system-memory device must have an id.");
+        return;
+    }
+    name = g_strdup_printf("%s.region", dev->id);
+
+    if (s->readonly) {
+        memory_region_init_rom(&s->mem, OBJECT(dev), name, s->size, errp);
+    } else {
+        memory_region_init_ram(&s->mem, OBJECT(dev), name, s->size, errp);
+    }
+
+    g_free(name);
+
+    if (!*errp) {
+        sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mem);
+    }
+}
+
+static void sysbus_memory_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->user_creatable = true;
+    dc->realize = sysbus_memory_realize;
+    device_class_set_props(dc, sysbus_memory_properties);
+}
+
+static const TypeInfo sysbus_memory_info = {
+    .name          = TYPE_SYSBUS_MEMORY,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SysBusMemoryState),
+    .class_init    = sysbus_memory_class_init,
+};
+
+static void sysbus_memory_register_types(void)
+{
+    type_register_static(&sysbus_memory_info);
+}
+
+type_init(sysbus_memory_register_types)
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 3c8fdef9f9..81e2de1d34 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -7,3 +7,5 @@ mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
 
 softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
+
+softmmu_ss.add(files('sysbus-memory.c'))
-- 
2.33.0


