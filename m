Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C216C6E92F6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524123.814780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSbz-0001uC-Hx; Thu, 20 Apr 2023 11:38:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524123.814780; Thu, 20 Apr 2023 11:38:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSbz-0001qe-Ef; Thu, 20 Apr 2023 11:38:03 +0000
Received: by outflank-mailman (input) for mailman id 524123;
 Thu, 20 Apr 2023 11:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onos=AL=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppSbx-0001nK-W9
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:38:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbebed97-df6f-11ed-8611-37d641c3527e;
 Thu, 20 Apr 2023 13:37:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-iWi0qQDrOru7dTdAiGIe9Q-1; Thu, 20 Apr 2023 07:37:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AD328996F3;
 Thu, 20 Apr 2023 11:37:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A66435AB7A;
 Thu, 20 Apr 2023 11:37:37 +0000 (UTC)
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
X-Inumbo-ID: cbebed97-df6f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681990677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrOhiPPcL+d6htjDrKGwRstWfOt7XytfnWLBr7kygzo=;
	b=WIsjsDVv7HyDtM1F6k3FF5u8ijz8HUAezGGDfpYIUXukK6UH9iK2vO6JZghNPOWHQUn4Tx
	+HfDJXSjmcjtDDw44RO5K66REStYoIKlqmjiJj0gTqmfzWnttunz00HLGeumfj9B4xTBzX
	NqabMQREecI3QkKYSiObZJeKxJeKOqs=
X-MC-Unique: iWi0qQDrOru7dTdAiGIe9Q-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Juan Quintela <quintela@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Julia Suvorova <jusual@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	Hanna Reitz <hreitz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	eesposit@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 01/20] hw/qdev: introduce qdev_is_realized() helper
Date: Thu, 20 Apr 2023 07:37:13 -0400
Message-Id: <20230420113732.336620-2-stefanha@redhat.com>
In-Reply-To: <20230420113732.336620-1-stefanha@redhat.com>
References: <20230420113732.336620-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Add a helper function to check whether the device is realized without
requiring the Big QEMU Lock. The next patch adds a second caller. The
goal is to avoid spreading DeviceState field accesses throughout the
code.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/qdev-core.h | 17 ++++++++++++++---
 hw/scsi/scsi-bus.c     |  3 +--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bd50ad5ee1..4d734cf35e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -1,6 +1,7 @@
 #ifndef QDEV_CORE_H
 #define QDEV_CORE_H
 
+#include "qemu/atomic.h"
 #include "qemu/queue.h"
 #include "qemu/bitmap.h"
 #include "qemu/rcu.h"
@@ -164,9 +165,6 @@ struct NamedClockList {
 
 /**
  * DeviceState:
- * @realized: Indicates whether the device has been fully constructed.
- *            When accessed outside big qemu lock, must be accessed with
- *            qatomic_load_acquire()
  * @reset: ResettableState for the device; handled by Resettable interface.
  *
  * This structure should not be accessed directly.  We declare it here
@@ -332,6 +330,19 @@ DeviceState *qdev_new(const char *name);
  */
 DeviceState *qdev_try_new(const char *name);
 
+/**
+ * qdev_is_realized:
+ * @dev: The device to check.
+ *
+ * May be called outside big qemu lock.
+ *
+ * Returns: %true% if the device has been fully constructed, %false% otherwise.
+ */
+static inline bool qdev_is_realized(DeviceState *dev)
+{
+    return qatomic_load_acquire(&dev->realized);
+}
+
 /**
  * qdev_realize: Realize @dev.
  * @dev: device to realize
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index c97176110c..07275fb631 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -60,8 +60,7 @@ static SCSIDevice *do_scsi_device_find(SCSIBus *bus,
      * the user access the device.
      */
 
-    if (retval && !include_unrealized &&
-        !qatomic_load_acquire(&retval->qdev.realized)) {
+    if (retval && !include_unrealized && !qdev_is_realized(&retval->qdev)) {
         retval = NULL;
     }
 
-- 
2.39.2


