Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57341524D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 23:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193048.343869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9ND-0000Ay-Lx; Wed, 22 Sep 2021 21:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193048.343869; Wed, 22 Sep 2021 21:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9ND-00008j-IX; Wed, 22 Sep 2021 21:01:47 +0000
Received: by outflank-mailman (input) for mailman id 193048;
 Wed, 22 Sep 2021 21:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6HN=OM=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mT9NB-0008HS-87
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 21:01:45 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 470d8a7b-1be8-11ec-b9df-12813bfff9fa;
 Wed, 22 Sep 2021 21:01:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id F3DEA21CC1;
 Wed, 22 Sep 2021 16:15:44 +0000 (UTC)
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
X-Inumbo-ID: 470d8a7b-1be8-11ec-b9df-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdnVuRz8orSzm80d4V6oo8FtHFI6VLNiM7CokKV1kg0=;
	b=FUm2HUwzttyCZe+8dhBbh50LnWpTBgfyRBKEmQweI52IibjcVgDn4DK1o5YtxElR7pK3VG
	FzivmPgZdVq7CIwOWz8C/0JHcJLoWkMZTuJkoIZq/q7EtIWQYR432EE+RLBVUQvkum1SsI
	7ZnOmjO/M8NkPARS4NSxeS/ky6/tWQE=
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
Subject: [RFC PATCH v2 01/16] rename MachineInitPhase enum constants for QAPI compatibility
Date: Wed, 22 Sep 2021 18:13:50 +0200
Message-Id: <20210922161405.140018-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

From: Mirela Grujic <mirela.grujic@greensocs.com>

This commit is a preparation to switch to a QAPI definition
of the MachineInitPhase enum.

QAPI will generate enumeration constants prefixed with the
MACHINE_INIT_PHASE_, so rename values accordingly.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 include/hw/qdev-core.h     | 10 +++++-----
 hw/core/machine-qmp-cmds.c |  2 +-
 hw/core/machine.c          |  6 +++---
 hw/core/qdev.c             |  2 +-
 hw/pci/pci.c               |  2 +-
 hw/usb/core.c              |  2 +-
 hw/virtio/virtio-iommu.c   |  2 +-
 monitor/hmp.c              |  2 +-
 softmmu/qdev-monitor.c     |  9 +++++----
 softmmu/vl.c               |  6 +++---
 ui/console.c               |  3 ++-
 11 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 34c8a7506a..859fd913bb 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -841,30 +841,30 @@ bool qdev_should_hide_device(QemuOpts *opts);
 
 typedef enum MachineInitPhase {
     /* current_machine is NULL.  */
-    PHASE_NO_MACHINE,
+    MACHINE_INIT_PHASE_NO_MACHINE,
 
     /* current_machine is not NULL, but current_machine->accel is NULL.  */
-    PHASE_MACHINE_CREATED,
+    MACHINE_INIT_PHASE_MACHINE_CREATED,
 
     /*
      * current_machine->accel is not NULL, but the machine properties have
      * not been validated and machine_class->init has not yet been called.
      */
-    PHASE_ACCEL_CREATED,
+    MACHINE_INIT_PHASE_ACCEL_CREATED,
 
     /*
      * machine_class->init has been called, thus creating any embedded
      * devices and validating machine properties.  Devices created at
      * this time are considered to be cold-plugged.
      */
-    PHASE_MACHINE_INITIALIZED,
+    MACHINE_INIT_PHASE_INITIALIZED,
 
     /*
      * QEMU is ready to start CPUs and devices created at this time
      * are considered to be hot-plugged.  The monitor is not restricted
      * to "preconfig" commands.
      */
-    PHASE_MACHINE_READY,
+    MACHINE_INIT_PHASE_READY,
 } MachineInitPhase;
 
 extern bool phase_check(MachineInitPhase phase);
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 216fdfaf3a..52168a3771 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -147,7 +147,7 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
 
 void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
 {
-    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
+    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
         error_setg(errp, "The command is permitted only before the machine has been created");
         return;
     }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528..9125c9aad0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1274,7 +1274,7 @@ void machine_run_board_init(MachineState *machine)
 
     accel_init_interfaces(ACCEL_GET_CLASS(machine->accelerator));
     machine_class->init(machine);
-    phase_advance(PHASE_MACHINE_INITIALIZED);
+    phase_advance(MACHINE_INIT_PHASE_INITIALIZED);
 }
 
 static NotifierList machine_init_done_notifiers =
@@ -1283,7 +1283,7 @@ static NotifierList machine_init_done_notifiers =
 void qemu_add_machine_init_done_notifier(Notifier *notify)
 {
     notifier_list_add(&machine_init_done_notifiers, notify);
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (phase_check(MACHINE_INIT_PHASE_READY)) {
         notify->notify(notify, NULL);
     }
 }
@@ -1306,7 +1306,7 @@ void qdev_machine_creation_done(void)
      * ok, initial machine setup is done, starting from now we can
      * only create hotpluggable devices
      */
-    phase_advance(PHASE_MACHINE_READY);
+    phase_advance(MACHINE_INIT_PHASE_READY);
     qdev_assert_realized_properly();
 
     /* TODO: once all bus devices are qdevified, this should be done
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a..c5fc704f55 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -904,7 +904,7 @@ static void device_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
 
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (phase_check(MACHINE_INIT_PHASE_READY)) {
         dev->hotplugged = 1;
         qdev_hot_added = true;
     }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 23d2ae2ab2..5ed798b480 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1102,7 +1102,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
     address_space_init(&pci_dev->bus_master_as,
                        &pci_dev->bus_master_container_region, pci_dev->name);
 
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (phase_check(MACHINE_INIT_PHASE_READY)) {
         pci_init_bus_master(pci_dev);
     }
     pci_dev->irq_state = 0;
diff --git a/hw/usb/core.c b/hw/usb/core.c
index 975f76250a..7a9a81c4fe 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -97,7 +97,7 @@ void usb_wakeup(USBEndpoint *ep, unsigned int stream)
     USBDevice *dev = ep->dev;
     USBBus *bus = usb_bus_from_device(dev);
 
-    if (!phase_check(PHASE_MACHINE_READY)) {
+    if (!phase_check(MACHINE_INIT_PHASE_READY)) {
         /*
          * This is machine init cold plug.  No need to wakeup anyone,
          * all devices will be reset anyway.  And trying to wakeup can
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1b23e8e18c..b777a80be2 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -948,7 +948,7 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
      * accept it. Having a different masks is possible but the guest will use
      * sub-optimal block sizes, so warn about it.
      */
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (phase_check(MACHINE_INIT_PHASE_READY)) {
         int new_granule = ctz64(new_mask);
         int cur_granule = ctz64(cur_mask);
 
diff --git a/monitor/hmp.c b/monitor/hmp.c
index d50c3124e1..ad012b0b22 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -216,7 +216,7 @@ static bool cmd_can_preconfig(const HMPCommand *cmd)
 
 static bool cmd_available(const HMPCommand *cmd)
 {
-    return phase_check(PHASE_MACHINE_READY) || cmd_can_preconfig(cmd);
+    return phase_check(MACHINE_INIT_PHASE_READY) || cmd_can_preconfig(cmd);
 }
 
 static void help_cmd_dump_one(Monitor *mon,
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0705f00846..25275984bd 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -262,7 +262,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 
     dc = DEVICE_CLASS(oc);
     if (!dc->user_creatable ||
-        (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
+        (phase_check(MACHINE_INIT_PHASE_READY) && !dc->hotpluggable)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
                    "a pluggable device type");
         return NULL;
@@ -649,7 +649,8 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
+    if (phase_check(MACHINE_INIT_PHASE_READY) && bus &&
+        !qbus_is_hotpluggable(bus)) {
         error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         return NULL;
     }
@@ -663,7 +664,7 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
     dev = qdev_new(driver);
 
     /* Check whether the hotplug is allowed by the machine */
-    if (phase_check(PHASE_MACHINE_READY)) {
+    if (phase_check(MACHINE_INIT_PHASE_READY)) {
         if (!qdev_hotplug_allowed(dev, errp)) {
             goto err_del_dev;
         }
@@ -1011,7 +1012,7 @@ int qemu_global_option(const char *str)
 
 bool qmp_command_available(const QmpCommand *cmd, Error **errp)
 {
-    if (!phase_check(PHASE_MACHINE_READY) &&
+    if (!phase_check(MACHINE_INIT_PHASE_READY) &&
         !(cmd->options & QCO_ALLOW_PRECONFIG)) {
         error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
                    cmd->name);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 55ab70eb97..d2552ba8ac 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2692,7 +2692,7 @@ static void qemu_machine_creation_done(void)
 
 void qmp_x_exit_preconfig(Error **errp)
 {
-    if (phase_check(PHASE_MACHINE_INITIALIZED)) {
+    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
         error_setg(errp, "The command is permitted only before machine initialization");
         return;
     }
@@ -3665,14 +3665,14 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_apply_legacy_machine_options(machine_opts_dict);
     qemu_apply_machine_options(machine_opts_dict);
     qobject_unref(machine_opts_dict);
-    phase_advance(PHASE_MACHINE_CREATED);
+    phase_advance(MACHINE_INIT_PHASE_MACHINE_CREATED);
 
     /*
      * Note: uses machine properties such as kernel-irqchip, must run
      * after qemu_apply_machine_options.
      */
     configure_accelerators(argv[0]);
-    phase_advance(PHASE_ACCEL_CREATED);
+    phase_advance(MACHINE_INIT_PHASE_ACCEL_CREATED);
 
     /*
      * Beware, QOM objects created before this point miss global and
diff --git a/ui/console.c b/ui/console.c
index eabbbc951c..b09b0f9760 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1353,7 +1353,8 @@ static QemuConsole *new_console(DisplayState *ds, console_type_t console_type,
     if (QTAILQ_EMPTY(&consoles)) {
         s->index = 0;
         QTAILQ_INSERT_TAIL(&consoles, s, next);
-    } else if (console_type != GRAPHIC_CONSOLE || phase_check(PHASE_MACHINE_READY)) {
+    } else if (console_type != GRAPHIC_CONSOLE ||
+               phase_check(MACHINE_INIT_PHASE_READY)) {
         QemuConsole *last = QTAILQ_LAST(&consoles);
         s->index = last->index + 1;
         QTAILQ_INSERT_TAIL(&consoles, s, next);
-- 
2.33.0


