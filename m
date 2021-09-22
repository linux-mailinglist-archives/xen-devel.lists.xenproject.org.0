Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81F4154A6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 02:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193214.344159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTCeP-0004YD-F9; Thu, 23 Sep 2021 00:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193214.344159; Thu, 23 Sep 2021 00:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTCeP-0004VR-A6; Thu, 23 Sep 2021 00:31:45 +0000
Received: by outflank-mailman (input) for mailman id 193214;
 Thu, 23 Sep 2021 00:31:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO2a=ON=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTCeO-0003xN-Mb
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 00:31:44 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ce81cae-1c05-11ec-b9f4-12813bfff9fa;
 Thu, 23 Sep 2021 00:31:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 6B2F521EB7;
 Wed, 22 Sep 2021 16:15:46 +0000 (UTC)
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
X-Inumbo-ID: 9ce81cae-1c05-11ec-b9f4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uO+rxeU8HZHEUI7sNPCnX4N20yxgThgHilFwN01tQgY=;
	b=4nwd0mKYOh88Bq4/k8c2ah+UaLuLdmXU2GInH88kJxYAg7EbL+YtSjZJK2c1dGQBJKmftg
	4vAVxgxK4VmkfrqkOGJ0zDbZ2nOewcMfN23UNSDTJ+uvKx1YBbYpqTbVYD/e/IUguDE62+
	uTYcsOtlMDJL+LNvRXe+uEKGS6FD+Ew=
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
Subject: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP command
Date: Wed, 22 Sep 2021 18:13:51 +0200
Message-Id: <20210922161405.140018-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

From: Mirela Grujic <mirela.grujic@greensocs.com>

The command returns current machine initialization phase.
From now on, the MachineInitPhase enum is generated from the
QAPI schema.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h     | 30 ++------------------
 hw/core/machine-qmp-cmds.c |  9 ++++++
 hw/core/qdev.c             |  5 ++++
 4 files changed, 72 insertions(+), 28 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..969d37fb03 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1312,3 +1312,59 @@
      '*cores': 'int',
      '*threads': 'int',
      '*maxcpus': 'int' } }
+
+##
+# @MachineInitPhase:
+#
+# Enumeration of machine initialization phases.
+#
+# @no-machine: machine does not exist
+#
+# @machine-created: machine is created, but its accelerator is not
+#
+# @accel-created: accelerator is created, but the machine properties have not
+#                 been validated and machine initialization is not done yet
+#
+# @initialized: machine is initialized, thus creating any embedded devices and
+#               validating machine properties. Devices created at this time are
+#               considered to be cold-plugged.
+#
+# @ready: QEMU is ready to start CPUs and devices created at this time are
+#         considered to be hot-plugged. The monitor is not restricted to
+#         "preconfig" commands.
+#
+# Since: 6.2
+##
+{ 'enum': 'MachineInitPhase',
+  'data': [ 'no-machine', 'machine-created', 'accel-created', 'initialized',
+            'ready' ] }
+
+##
+# @MachineInitPhaseStatus:
+#
+# Information about machine initialization phase
+#
+# @phase: the machine initialization phase
+#
+# Since: 6.2
+##
+{ 'struct': 'MachineInitPhaseStatus',
+  'data': { 'phase': 'MachineInitPhase' } }
+
+##
+# @query-machine-phase:
+#
+# Return machine initialization phase
+#
+# Since: 6.2
+#
+# Returns: MachineInitPhaseStatus
+#
+# Example:
+#
+# -> { "execute": "query-machine-phase" }
+# <- { "return": { "phase": "initialized" } }
+#
+##
+{ 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
+             'allow-preconfig': true }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 859fd913bb..800eda8f54 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -1,6 +1,7 @@
 #ifndef QDEV_CORE_H
 #define QDEV_CORE_H
 
+#include "qapi/qapi-types-machine.h"
 #include "qemu/queue.h"
 #include "qemu/bitmap.h"
 #include "qemu/rcu.h"
@@ -839,35 +840,8 @@ void device_listener_unregister(DeviceListener *listener);
  */
 bool qdev_should_hide_device(QemuOpts *opts);
 
-typedef enum MachineInitPhase {
-    /* current_machine is NULL.  */
-    MACHINE_INIT_PHASE_NO_MACHINE,
-
-    /* current_machine is not NULL, but current_machine->accel is NULL.  */
-    MACHINE_INIT_PHASE_MACHINE_CREATED,
-
-    /*
-     * current_machine->accel is not NULL, but the machine properties have
-     * not been validated and machine_class->init has not yet been called.
-     */
-    MACHINE_INIT_PHASE_ACCEL_CREATED,
-
-    /*
-     * machine_class->init has been called, thus creating any embedded
-     * devices and validating machine properties.  Devices created at
-     * this time are considered to be cold-plugged.
-     */
-    MACHINE_INIT_PHASE_INITIALIZED,
-
-    /*
-     * QEMU is ready to start CPUs and devices created at this time
-     * are considered to be hot-plugged.  The monitor is not restricted
-     * to "preconfig" commands.
-     */
-    MACHINE_INIT_PHASE_READY,
-} MachineInitPhase;
-
 extern bool phase_check(MachineInitPhase phase);
 extern void phase_advance(MachineInitPhase phase);
+extern MachineInitPhase phase_get(void);
 
 #endif
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 52168a3771..d3b9a04855 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -204,3 +204,12 @@ MemdevList *qmp_query_memdev(Error **errp)
     object_child_foreach(obj, query_memdev, &list);
     return list;
 }
+
+MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
+{
+    MachineInitPhaseStatus *status = g_malloc0(sizeof(*status));
+
+    status->phase = phase_get();
+
+    return status;
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index c5fc704f55..d83f1c029a 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1150,6 +1150,11 @@ void phase_advance(MachineInitPhase phase)
     machine_phase = phase;
 }
 
+MachineInitPhase phase_get(void)
+{
+    return machine_phase;
+}
+
 static const TypeInfo device_type_info = {
     .name = TYPE_DEVICE,
     .parent = TYPE_OBJECT,
-- 
2.33.0


