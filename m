Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3FA4153D5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 01:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193161.344049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBYb-00087K-1L; Wed, 22 Sep 2021 23:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193161.344049; Wed, 22 Sep 2021 23:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBYa-00085G-Tt; Wed, 22 Sep 2021 23:21:40 +0000
Received: by outflank-mailman (input) for mailman id 193161;
 Wed, 22 Sep 2021 23:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6HN=OM=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTBYZ-000855-NI
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 23:21:40 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b3a0fff-eaee-44ed-89e8-1c05f0426f58;
 Wed, 22 Sep 2021 23:21:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 52F9C21EBA;
 Wed, 22 Sep 2021 16:15:47 +0000 (UTC)
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
X-Inumbo-ID: 9b3a0fff-eaee-44ed-89e8-1c05f0426f58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGnYGLYTZlt4UtXZbiZtPB9v0oVww6LTMwGhigIhC4w=;
	b=UPbC1fzbJrfdLTp7ZSQj2uQcWDXflOXpR/G4vVRGW9kdVFULzUF67xhe1kfuNYSz/JpOy1
	wbygKgvKMOyqx7pbbTbb6Y8z+9IiPW9zihN9nMV81AsEGbTgqsQrzORivur2m5ElixWh2H
	hKLkReYRjURA8IUJP7ZqkVTFDvxTEQs=
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
Subject: [RFC PATCH v2 03/16] qapi: Implement x-machine-init QMP command
Date: Wed, 22 Sep 2021 18:13:52 +0200
Message-Id: <20210922161405.140018-4-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

From: Mirela Grujic <mirela.grujic@greensocs.com>

The x-machine-init QMP command is available only if the -preconfig option
is used and the current machine initialization phase is accel-created.

The command triggers QEMU to enter machine initialized phase and wait
for the QMP configuration. In future commits, we will add the possiblity
to create devices at this point.

To exit the initialized phase use the x-exit-preconfig QMP command.

Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
---
 qapi/machine.json | 23 +++++++++++++++++++++++
 softmmu/vl.c      | 19 +++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 969d37fb03..56330c0e8e 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1368,3 +1368,26 @@
 ##
 { 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
              'allow-preconfig': true }
+
+##
+# @x-machine-init:
+#
+# Enter machine initialized phase
+#
+# Since: 6.2
+#
+# Returns: If successful, nothing
+#
+# Notes: This command will trigger QEMU to execute initialization steps
+#        that are required to enter the machine initialized phase. The command
+#        is available only if the -preconfig command line option was passed and
+#        if the machine is currently in the accel-created phase. To exit the
+#        machine initialized phase use the x-exit-preconfig command.
+#
+# Example:
+#
+# -> { "execute": "x-machine-init" }
+# <- { "return": {} }
+#
+##
+{ 'command': 'x-machine-init', 'allow-preconfig': true }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index d2552ba8ac..84c5132ad7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -123,6 +123,7 @@
 #include "qapi/qapi-visit-qom.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-machine.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/iothread.h"
 #include "qemu/guest-random.h"
@@ -2610,10 +2611,16 @@ static void qemu_init_displays(void)
     }
 }
 
-static void qemu_init_board(void)
+void qmp_x_machine_init(Error **errp)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
 
+    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
+        error_setg(errp, "The command is permitted only before "
+                         "the machine is initialized");
+        return;
+    }
+
     if (machine_class->default_ram_id && current_machine->ram_size &&
         numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
         create_default_memdev(current_machine, mem_path);
@@ -2692,12 +2699,16 @@ static void qemu_machine_creation_done(void)
 
 void qmp_x_exit_preconfig(Error **errp)
 {
-    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
-        error_setg(errp, "The command is permitted only before machine initialization");
+    if (phase_check(MACHINE_INIT_PHASE_READY)) {
+        error_setg(errp, "The command is permitted only before "
+                         "the machine is ready");
         return;
     }
 
-    qemu_init_board();
+    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
+        qmp_x_machine_init(errp);
+    }
+
     qemu_create_cli_devices();
     qemu_machine_creation_done();
 
-- 
2.33.0


