Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457CF271406
	for <lists+xen-devel@lfdr.de>; Sun, 20 Sep 2020 13:45:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJxlf-0004NG-IP; Sun, 20 Sep 2020 11:44:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vT6p=C5=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1kJxle-0004Lx-6c
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2020 11:44:30 +0000
X-Inumbo-ID: f1716476-9da3-4162-9a12-b8601e05e8be
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1716476-9da3-4162-9a12-b8601e05e8be;
 Sun, 20 Sep 2020 11:44:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x23so9429898wmi.3
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2020 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDZhs8OFrfrf0ft3+p7SBZ8r0XClNoxh4cVoI6p7qzo=;
 b=bJoXXiW1EZOomSQyJVoxt8zqTE0ZRs7sW5oOl31UvpYvuYjQTqmKNJ6VVr03VEsG95
 jqmF8m18GbJsy7BvsFRpkozw3KO2Veo0eqZI9/QzW2c6ltfQeIEF5x41M6KCjAjOx5yS
 Bcm9jpAwZm2Byp4gtJB0bmngB/sSeZpL72ckcNU3AazBLvm/WP3mCtzatAR3AUqe6KkY
 UdKhWkHNEy3XbfH4J73ANDeqVTNMNEhPp3zUeQnZ0JEyyrRQCXIGmHtduOuL/SSIS6IK
 KOOvHdnKzKIxOFunTx9R9S43rCk/S/az2ewbHhbRJ5e5cQ/7VIYVl4Y9grShrrmw+HcA
 xVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fDZhs8OFrfrf0ft3+p7SBZ8r0XClNoxh4cVoI6p7qzo=;
 b=Mzqwy2hB7R76aPUcDKJvIYXyw7cKMU0Ks+Lr9fZR/2l/dFLybVHNeVY4w3y/08FP9o
 rZpa7llxzXq51je1oyDr2q7CMSDgFnlkexdFYUFqRhEvQDxIjWlSRjHGQRHlNBwLn1dV
 ceJTgCDdz/DITm5/6gorO8xeuII9RvDqxn7plu5rY54qTEymKlltAh45ow82ELyEp5oE
 AHgw0Aq26tNCDs8SYOxTy3lTxNz0Ht6BByRbxXY6PLeJDLwCBfKzTdYghMUdsh5HMzE5
 CPe0y47emNFcTKnAzWVOi2ZxxiHwpIZtG+uekaSIg5N6LKsI9xTgQYjzuex3CpOb3G83
 AjUg==
X-Gm-Message-State: AOAM531Q60g1SGymhInahFs7jCh6FFdoL1Gessjysk3+wWo0wlJbM4bV
 9ekHZ/S8EQudqv4OM0K4qs4=
X-Google-Smtp-Source: ABdhPJypuqaFdVNqHvBqpI9crdclAyxoTwFQkqDzODv3j/C3VX/NRNCq6A2dZPfYNEJ99K9Jv5UuUA==
X-Received: by 2002:a1c:80d7:: with SMTP id
 b206mr24808459wmd.161.1600602261568; 
 Sun, 20 Sep 2020 04:44:21 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id e18sm16415708wra.36.2020.09.20.04.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 04:44:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/2] qdev: Let BusRealize() return a boolean value to indicate
 error
Date: Sun, 20 Sep 2020 13:44:16 +0200
Message-Id: <20200920114416.353277-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920114416.353277-1-f4bug@amsat.org>
References: <20200920114416.353277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 9940b2cfbc0 introduced qdev_realize() and qbus_realize()
with the ability to return a boolean value if an error occured,
thus the caller does not need to check if the Error* pointer is
set.
Provide the same ability to the BusRealize type.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h | 14 +++++++++++++-
 hw/hyperv/vmbus.c      |  5 +++--
 hw/nubus/nubus-bus.c   |  5 +++--
 hw/pci/pci.c           | 12 +++++++++---
 hw/xen/xen-bus.c       |  5 +++--
 5 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 02ac1c50b7f..eecfe794a71 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -32,7 +32,19 @@ typedef enum DeviceCategory {
 typedef void (*DeviceRealize)(DeviceState *dev, Error **errp);
 typedef void (*DeviceUnrealize)(DeviceState *dev);
 typedef void (*DeviceReset)(DeviceState *dev);
-typedef void (*BusRealize)(BusState *bus, Error **errp);
+/**
+ * BusRealize: Realize @bus.
+ * @bus: bus to realize
+ * @errp: pointer to error object
+ *
+ * On success, return true.
+ * On failure, store an error through @errp and return false.
+ */
+typedef bool (*BusRealize)(BusState *bus, Error **errp);
+/**
+ * BusUnrealize: Unrealize @bus.
+ * @bus: bus to unrealize
+ */
 typedef void (*BusUnrealize)(BusState *bus);
 
 /**
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index 6ef895bc352..8a0452b2464 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -2487,7 +2487,7 @@ static const TypeInfo vmbus_dev_type_info = {
     .instance_init = vmbus_dev_instance_init,
 };
 
-static void vmbus_realize(BusState *bus, Error **errp)
+static bool vmbus_realize(BusState *bus, Error **errp)
 {
     int ret = 0;
     Error *local_err = NULL;
@@ -2519,7 +2519,7 @@ static void vmbus_realize(BusState *bus, Error **errp)
         goto clear_event_notifier;
     }
 
-    return;
+    return true;
 
 clear_event_notifier:
     event_notifier_cleanup(&vmbus->notifier);
@@ -2528,6 +2528,7 @@ remove_msg_handler:
 error_out:
     qemu_mutex_destroy(&vmbus->rx_queue_lock);
     error_propagate(errp, local_err);
+    return false;
 }
 
 static void vmbus_unrealize(BusState *bus)
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 942a6d5342d..d20d9c0f72c 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -65,12 +65,13 @@ static const MemoryRegionOps nubus_super_slot_ops = {
     },
 };
 
-static void nubus_realize(BusState *bus, Error **errp)
+static bool nubus_realize(BusState *bus, Error **errp)
 {
     if (!nubus_find()) {
         error_setg(errp, "at most one %s device is permitted", TYPE_NUBUS_BUS);
-        return;
+        return false;
     }
+    return true;
 }
 
 static void nubus_init(Object *obj)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index de0fae10ab9..f535ebac847 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -115,7 +115,7 @@ static void pcibus_machine_done(Notifier *notifier, void *data)
     }
 }
 
-static void pci_bus_realize(BusState *qbus, Error **errp)
+static bool pci_bus_realize(BusState *qbus, Error **errp)
 {
     PCIBus *bus = PCI_BUS(qbus);
 
@@ -123,13 +123,17 @@ static void pci_bus_realize(BusState *qbus, Error **errp)
     qemu_add_machine_init_done_notifier(&bus->machine_done);
 
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_pcibus, bus);
+
+    return true;
 }
 
-static void pcie_bus_realize(BusState *qbus, Error **errp)
+static bool pcie_bus_realize(BusState *qbus, Error **errp)
 {
     PCIBus *bus = PCI_BUS(qbus);
 
-    pci_bus_realize(qbus, errp);
+    if (!pci_bus_realize(qbus, errp)) {
+        return false;
+    }
 
     /*
      * A PCI-E bus can support extended config space if it's the root
@@ -144,6 +148,8 @@ static void pcie_bus_realize(BusState *qbus, Error **errp)
             bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
         }
     }
+
+    return true;
 }
 
 static void pci_bus_unrealize(BusState *qbus)
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 9ce1c9540b9..d7ef5d05e37 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -444,7 +444,7 @@ static void xen_bus_unrealize(BusState *bus)
     }
 }
 
-static void xen_bus_realize(BusState *bus, Error **errp)
+static bool xen_bus_realize(BusState *bus, Error **errp)
 {
     XenBus *xenbus = XEN_BUS(bus);
     unsigned int domid;
@@ -478,10 +478,11 @@ static void xen_bus_realize(BusState *bus, Error **errp)
                           "failed to set up enumeration watch: ");
     }
 
-    return;
+    return true;
 
 fail:
     xen_bus_unrealize(bus);
+    return false;
 }
 
 static void xen_bus_unplug_request(HotplugHandler *hotplug,
-- 
2.26.2


