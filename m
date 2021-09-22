Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC34154A7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 02:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193213.344142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTCeM-00046B-1N; Thu, 23 Sep 2021 00:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193213.344142; Thu, 23 Sep 2021 00:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTCeL-00040J-Ta; Thu, 23 Sep 2021 00:31:41 +0000
Received: by outflank-mailman (input) for mailman id 193213;
 Thu, 23 Sep 2021 00:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO2a=ON=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTCeK-0003xO-8a
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 00:31:40 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 333be660-3c1a-4c30-818c-689c9aa597fb;
 Thu, 23 Sep 2021 00:31:39 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 29DC821ECF;
 Wed, 22 Sep 2021 16:15:57 +0000 (UTC)
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
X-Inumbo-ID: 333be660-3c1a-4c30-818c-689c9aa597fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFwTgaEumzc2XGbjK4hpWpdj4pZUzdb1skxz4Vmg8i8=;
	b=J+Wmqk4a8kuzHCMVCeIGgJjNaAhGIf80oYCh+/fvuoSlwd8WukKbcCqGi6wVcYUIS4uQKG
	/a8dur7Nk0YA6/FfoYgSVEqf/P0POAC01x1RLhg1ZUWOh0CgUNQ4C0nG1dSJsSu+dGdi1N
	f1rziCvvT/vfiWxVDVTEbOMcSei2Y0c=
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
Subject: [RFC PATCH v2 12/16] add x-sysbus-mmio-map qmp command
Date: Wed, 22 Sep 2021 18:14:01 +0200
Message-Id: <20210922161405.140018-13-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

This command allows to map an mmio region of sysbus device onto
the system memory. Its behavior mimics the sysbus_mmio_map()
function apart from the automatic unmap (the C function unmaps
the region if it is already mapped).
For the qmp function we consider it is an error to try to map
an already mapped function. If unmapping is required, it is
probably better to add a sysbus-mmip-unmap function.

This command is still experimental (hence the x prefix), as it
is related to the sysbus device creation through qmp commands.

In future, we expect to have to handle the overlap/priority
parameter but also multiple mapping of one mmio. For some
devices, one mmio is mapped several times at different addresses on
the bus (which is not supported by sysbus_mmio_map() function and
requires the use of memory region aliases).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Note: this qmp command is required to be able to build a machine from
scratch as there is no qmp-way of doing a memory mapping today.

We've added the command into qapi/qdev.json section. It does not seem to
have any really adequate section yet. Any idea ? should we create for
example a new one: qapi/sysbus.json or qapi/memory.json ?
---
 qapi/qdev.json   | 21 +++++++++++++++++++++
 hw/core/sysbus.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index ad669ae175..dfc1104197 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -125,3 +125,24 @@
 ##
 { 'event': 'DEVICE_DELETED',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @x-sysbus-mmio-map:
+#
+# Map a sysbus device mmio onto the main system bus.
+#
+# @device: the device's QOM path
+#
+# @mmio: The mmio number to be mapped (defaults to 0).
+#
+# @addr: The base address for the mapping.
+#
+# Since: 6.2
+#
+# Returns: Nothing on success
+#
+##
+
+{ 'command': 'x-sysbus-mmio-map',
+  'data': {'device': 'str', '*mmio': 'uint8', 'addr': 'uint64'},
+  'allow-preconfig' : true }
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index aaae8e23cc..b0891f37b6 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -23,6 +23,7 @@
 #include "hw/sysbus.h"
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
+#include "qapi/qapi-commands-qdev.h"
 
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
@@ -154,6 +155,46 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
     }
 }
 
+void qmp_x_sysbus_mmio_map(const char *device, bool has_mmio, uint8_t mmio,
+                           uint64_t addr, Error **errp)
+{
+    Object *obj = object_resolve_path_type(device, TYPE_SYS_BUS_DEVICE, NULL);
+    SysBusDevice *dev;
+
+    if (phase_get() != MACHINE_INIT_PHASE_INITIALIZED) {
+        error_setg(errp, "The command is permitted only when "
+                         "the machine is in initialized phase");
+        return;
+    }
+
+    if (obj == NULL) {
+        error_setg(errp, "Device '%s' not found", device);
+        return;
+    }
+
+    dev = SYS_BUS_DEVICE(obj);
+    if (!has_mmio) {
+        mmio = 0;
+    }
+    if (mmio >= dev->num_mmio) {
+        error_setg(errp, "MMIO index '%u' is out of range", mmio);
+        return;
+    }
+
+    if (dev->mmio[mmio].addr != (hwaddr)-1) {
+        error_setg(errp, "MMIO index '%u' is already mapped", mmio);
+        return;
+    }
+
+    if (!memory_region_try_add_subregion(get_system_memory(), addr,
+                                         dev->mmio[mmio].memory, 0,
+                                         errp)) {
+        return;
+    }
+
+    dev->mmio[mmio].addr = addr;
+}
+
 void sysbus_mmio_unmap(SysBusDevice *dev, int n)
 {
     assert(n >= 0 && n < dev->num_mmio);
-- 
2.33.0


