Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06B4154A5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 02:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193212.344136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTCeL-00040l-OD; Thu, 23 Sep 2021 00:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193212.344136; Thu, 23 Sep 2021 00:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTCeL-0003xZ-KC; Thu, 23 Sep 2021 00:31:41 +0000
Received: by outflank-mailman (input) for mailman id 193212;
 Thu, 23 Sep 2021 00:31:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO2a=ON=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTCeJ-0003xN-Tn
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 00:31:40 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ce9660e-1c05-11ec-b9f4-12813bfff9fa;
 Thu, 23 Sep 2021 00:31:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 615DE21EC9;
 Wed, 22 Sep 2021 16:15:54 +0000 (UTC)
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
X-Inumbo-ID: 9ce9660e-1c05-11ec-b9f4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDCjVxFBi4vz75aeR9pd9AbmoW6STuPuMbNBE/FSM7I=;
	b=ICuAAVCXm0R5uk9SjJ8PoZaJwYoy4CElxlYLonWdbRGOal6uenKQyWFhRGYtaMcpNGrB6U
	a6eNGZVWTngTm/nJTjQ651qUUGJcEfSF62QKzWyQ8J+LWw+rY7XTtY9hl/Kg9JWezPiQT2
	mj0ltS02PcDOghYVnG1qEo0ZJHBn8H4=
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
Subject: [RFC PATCH v2 09/16] hw/core/machine: Remove the dynamic sysbus devices type check
Date: Wed, 22 Sep 2021 18:13:58 +0200
Message-Id: <20210922161405.140018-10-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

Now that we check sysbus device types during device creation, we
can remove the check done in the machine init done notifier.
This was the only thing done by this notifier, so we remove the
whole sysbus_notifier structure of the MachineState.

Note: This notifier was checking all /peripheral and /peripheral-anon
sysbus devices. Now we only check those added by -device cli option or
device_add qmp command when handling the command/option. So if there
are some devices added in one of these containers manually (eg in
machine C code), these will not be checked anymore.
This use case does not seem to appear apart from
hw/xen/xen-legacy-backend.c (it uses qdev_set_id() and in this case,
not for a sysbus device, so it's ok).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/boards.h |  1 -
 hw/core/machine.c   | 27 ---------------------------
 2 files changed, 28 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 934443c1cd..ccbc40355a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -311,7 +311,6 @@ typedef struct CpuTopology {
 struct MachineState {
     /*< private >*/
     Object parent_obj;
-    Notifier sysbus_notifier;
 
     /*< public >*/
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1a18912dc8..521438e90a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -571,18 +571,6 @@ bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
     return allowed;
 }
 
-static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
-{
-    MachineState *machine = opaque;
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-
-    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
-        error_report("Option '-device %s' cannot be handled by this machine",
-                     object_class_get_name(object_get_class(OBJECT(sbdev))));
-        exit(1);
-    }
-}
-
 static char *machine_get_memdev(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -598,17 +586,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
     ms->ram_memdev_id = g_strdup(value);
 }
 
-static void machine_init_notify(Notifier *notifier, void *data)
-{
-    MachineState *machine = MACHINE(qdev_get_machine());
-
-    /*
-     * Loop through all dynamically created sysbus devices and check if they are
-     * all allowed.  If a device is not allowed, error out.
-     */
-    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
-}
-
 HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 {
     int i;
@@ -1030,10 +1007,6 @@ static void machine_initfn(Object *obj)
                                         "Table (HMAT)");
     }
 
-    /* Register notifier when init is done for sysbus sanity checks */
-    ms->sysbus_notifier.notify = machine_init_notify;
-    qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
-
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
-- 
2.33.0


