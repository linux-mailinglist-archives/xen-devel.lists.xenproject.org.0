Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D441552A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 03:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193248.344205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTDk7-0004tk-Kr; Thu, 23 Sep 2021 01:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193248.344205; Thu, 23 Sep 2021 01:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTDk7-0004qt-Gl; Thu, 23 Sep 2021 01:41:43 +0000
Received: by outflank-mailman (input) for mailman id 193248;
 Thu, 23 Sep 2021 01:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO2a=ON=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTDk4-0004qh-Nh
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 01:41:41 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5d6653f-99af-4080-bc90-d4366a303960;
 Thu, 23 Sep 2021 01:41:39 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4E73021ECB;
 Wed, 22 Sep 2021 16:15:55 +0000 (UTC)
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
X-Inumbo-ID: b5d6653f-99af-4080-bc90-d4366a303960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ow5aMrqN/i5D/dv1vm+J5tz7Z/sAyFJH5Io1/i7HEmw=;
	b=cHbJePzpcvHXQEkqOdmaeWcRNrJ837qUy9Smnwsf4FkYlw79QNCGGyVPvnpY0eWxfDYkrY
	Gcyfi8h/ljklnuDrFdhj+SC0Q9suuCMFH6X6PkgUXB/DYK4rXoUWqJXJJmrOrjy7EPcEAj
	CWsJ/7O0ROaTwhJk7Qw6cuIAJX3Xrb8=
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
Subject: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device before machine is ready
Date: Wed, 22 Sep 2021 18:13:59 +0200
Message-Id: <20210922161405.140018-11-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

Skip the sysbus device type per-machine allow-list check before the
MACHINE_INIT_PHASE_READY phase.

This patch permits adding any sysbus device (it still needs to be
user_creatable) when using the -preconfig experimental option.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

This commit is RFC. Depending on the condition to allow a device
to be added, it may change.
---
 softmmu/qdev-monitor.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index f1c9242855..73b991adda 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
         return NULL;
     }
 
-    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
-        /* sysbus devices need to be allowed by the machine */
+    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
+        phase_check(MACHINE_INIT_PHASE_READY)) {
+        /*
+         * Sysbus devices need to be allowed by the machine.
+         * We only check that after the machine is ready in order to let
+         * us add any user_creatable sysbus device during machine creation.
+         */
         MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
         if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
             error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
-- 
2.33.0


