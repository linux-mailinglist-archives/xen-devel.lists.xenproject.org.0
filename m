Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539034153D7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 01:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193162.344057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBYb-0008FT-Cr; Wed, 22 Sep 2021 23:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193162.344057; Wed, 22 Sep 2021 23:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBYb-00087M-7r; Wed, 22 Sep 2021 23:21:41 +0000
Received: by outflank-mailman (input) for mailman id 193162;
 Wed, 22 Sep 2021 23:21:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6HN=OM=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mTBYZ-000854-KW
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 23:21:40 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5839110-1bfb-11ec-b9f2-12813bfff9fa;
 Wed, 22 Sep 2021 23:21:38 +0000 (UTC)
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id F1D0E21EC1;
 Wed, 22 Sep 2021 16:15:49 +0000 (UTC)
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
X-Inumbo-ID: d5839110-1bfb-11ec-b9f2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1632327350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPWHcx8frG0Bxx16IuAMBta1shU2F7IxandpxY+0m3o=;
	b=R2JacUH5kcSgL3a0GBx59skiUZLwlJrwuwsPCJPKp/jfsGnSFIs+eudHgACISfwNN8yzup
	PCA4EJ5Gc/WoYe//HHjbUL42WxmqWvbtS6uTYjxX75b2H+nsza1Ny7Oyp1hqgAG32pAcXI
	W+J++3yJDsAwelYtREZpkVK9EkRGLEc=
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
Subject: [RFC PATCH v2 05/16] qdev-monitor: prevent conflicts between qmp/device_add and cli/-device
Date: Wed, 22 Sep 2021 18:13:54 +0200
Message-Id: <20210922161405.140018-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

This commit prepares to extend device_add qmp command when using
-preconfig option.

In order to avoid conflicts with the cli -device option handling, we
need to handle some special case with the QemuOpts.
The qemu_device_opts is traversed when switching from
MACHINE_INIT_PHASE_INITIALIZED to MACHINE_INIT_PHASE_READY in order
to create any device specified by cli -device. Until now any
device_add qmp command was issued after that point so there was no
problem.

If we execute the qmp command before the MACHINE_INIT_PHASE_READY
phase we need to discard the QemuOpts from the qemu_device_opts in
order to avoid the cli -device code to try to create the device
again.

This commit preserves the opts behavior regarding the devices added
in 'ready' phase by the QMP command device_add.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Although we keep the original behavior for QMP commands issued when
the machine is ready (only authorized case so far), we are not sure
it is necessary: keeping the opts in the list is not needed anymore
to ensure the id uniqueness of devices but it has the 2 following
consequences:

1. the device opts stay in the QemuOptsList. Is this list needed
   after traversing the device cli options?

2. the DeviceState "opts" field is set. Do we need to keep it after
   the device is realized ?

Any information on this will be appreciated.
---
 softmmu/qdev-monitor.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0007698ff3..834f2b56b5 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -848,6 +848,23 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
     if (!dev) {
         qemu_opts_del(opts);
         return;
+    } else if (!phase_check(MACHINE_INIT_PHASE_READY)) {
+        /*
+         * Always delete the related opts in case the device was created
+         * before handling of cli -device arguments:
+         * We do not want a device added by the qmp command to be handled
+         * again by the cli -device creation code. This does not break
+         * the ID uniqueness because it is checked in qdev_device_add().
+         *
+         * Note: We check the phase in order to keep the legacy behavior:
+         * in the machine ready phase case, the QemuOpts remains in the list
+         * (and the dev->opts field is kept).
+         * If it happens it was done only to ensure the ID uniqueness and
+         * the QemuOpts is never used after this point: then we could
+         * remove QemuOpts in any phase.
+         */
+        dev->opts = NULL;
+        qemu_opts_del(opts);
     }
     object_unref(OBJECT(dev));
 }
-- 
2.33.0


