Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792571E6FC0
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 00:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeRRF-0001XQ-I1; Thu, 28 May 2020 22:55:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leMz=7K=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jeRRD-0001WY-Gc
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 22:55:47 +0000
X-Inumbo-ID: 5c2bad8e-a136-11ea-9947-bc764e2007e4
Received: from forwardcorp1j.mail.yandex.net (unknown [2a02:6b8:0:1619::183])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c2bad8e-a136-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 22:55:44 +0000 (UTC)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 925782E0E4D;
 Fri, 29 May 2020 01:55:42 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 8FKAi2zKzd-tex0vN3w; Fri, 29 May 2020 01:55:42 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590706542; bh=jZjZvWgRCwmhlfFa7bumuR0eozqg540D/Q+LuGee5IQ=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=SnBI9IKbDRTF4vvxqHoqoTFMnQUlJCk+8D1m7FNWSTvAa/UTvtp+e6/dXw3I+Lzj3
 oycmaxScqeIySlf14+pJHiQNpxHawDh3hVQO58cR0kpiSUz9+hc0viN/gZpfp/ykt5
 jIdgHapwCEdCuxup82PXmt25PQLrc1uqHksljX6g=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 tdfEhvD3Vg-tdWSLP5D; Fri, 29 May 2020 01:55:39 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/8] qdev-properties: make blocksize accept size suffixes
Date: Fri, 29 May 2020 01:55:13 +0300
Message-Id: <20200528225516.1676602-6-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
References: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It appears convenient to be able to specify physical_block_size and
logical_block_size using common size suffixes.

Teach the blocksize property setter to interpret them.  Also express the
upper and lower limits in the respective units.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/core/qdev-properties.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 40c13f6ebe..c9af6a1341 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -14,6 +14,7 @@
 #include "qapi/visitor.h"
 #include "chardev/char.h"
 #include "qemu/uuid.h"
+#include "qemu/units.h"
 
 void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
                                   Error **errp)
@@ -771,17 +772,18 @@ const PropertyInfo qdev_prop_size32 = {
 
 /* lower limit is sector size */
 #define MIN_BLOCK_SIZE          512
-#define MIN_BLOCK_SIZE_STR      stringify(MIN_BLOCK_SIZE)
+#define MIN_BLOCK_SIZE_STR      "512 B"
 /* upper limit is the max power of 2 that fits in uint16_t */
-#define MAX_BLOCK_SIZE          32768
-#define MAX_BLOCK_SIZE_STR      stringify(MAX_BLOCK_SIZE)
+#define MAX_BLOCK_SIZE          (32 * KiB)
+#define MAX_BLOCK_SIZE_STR      "32 KiB"
 
 static void set_blocksize(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint16_t value, *ptr = qdev_get_prop_ptr(dev, prop);
+    uint16_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t value;
     Error *local_err = NULL;
 
     if (dev->realized) {
@@ -789,7 +791,7 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    visit_type_uint16(v, name, &value, &local_err);
+    visit_type_size(v, name, &value, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -797,7 +799,7 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
     /* value of 0 means "unset" */
     if (value && (value < MIN_BLOCK_SIZE || value > MAX_BLOCK_SIZE)) {
         error_setg(errp,
-                   "Property %s.%s doesn't take value %" PRIu16
+                   "Property %s.%s doesn't take value %" PRIu64
                    " (minimum: " MIN_BLOCK_SIZE_STR
                    ", maximum: " MAX_BLOCK_SIZE_STR ")",
                    dev->id ? : "", name, value);
@@ -816,7 +818,7 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
 }
 
 const PropertyInfo qdev_prop_blocksize = {
-    .name  = "uint16",
+    .name  = "size",
     .description = "A power of two between " MIN_BLOCK_SIZE_STR
                    " and " MAX_BLOCK_SIZE_STR,
     .get   = get_uint16,
-- 
2.26.2


