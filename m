Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D51E6DDA
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:40:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQGE-0002q3-CD; Thu, 28 May 2020 21:40:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leMz=7K=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jeQGD-0002pi-8R
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:40:21 +0000
X-Inumbo-ID: d2d25b1e-a12b-11ea-9947-bc764e2007e4
Received: from forwardcorp1p.mail.yandex.net (unknown
 [2a02:6b8:0:1472:2741:0:8b6:217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2d25b1e-a12b-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 21:40:18 +0000 (UTC)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id A2AEC2E094D;
 Fri, 29 May 2020 00:40:17 +0300 (MSK)
Received: from vla5-58875c36c028.qloud-c.yandex.net
 (vla5-58875c36c028.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:5887:5c36])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 XyXqfhV9ak-eBImwSEL; Fri, 29 May 2020 00:40:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590702017; bh=e/snD3eRLt3OD/77mBucMy84xJYC36ARRHwF7w0zqIc=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=a61iP8p1OPQXlCsL4kqDkdM1sPBrQA9F1w+ycRSumQdjV4xDstR5Ny80gfxO/6esp
 /FcUhqt6Jujttn9Mm77h/cHfZ5Mv6IY0LDDhTjwmgpFyFO7ZrjYnwed7WcpG6NBBba
 HAkjADgLWt15cvwTlBp0FcTWXNGN8BqNNOC1Cx5g=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by vla5-58875c36c028.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KqoauPPys3-eBXqvQYw; Fri, 29 May 2020 00:40:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 3/8] qdev-properties: blocksize: use same limits in code
 and description
Date: Fri, 29 May 2020 00:39:41 +0300
Message-Id: <20200528213946.1636444-4-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
References: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Make it easier (more visible) to maintain the limits on the blocksize
properties in sync with the respective description, by using macros both
in the code and in the description.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
v4 -> v5:
- split out into separate patch [Philippe]

 hw/core/qdev-properties.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index cc924815da..249dc69bd8 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -729,6 +729,13 @@ const PropertyInfo qdev_prop_pci_devfn = {
 
 /* --- blocksize --- */
 
+/* lower limit is sector size */
+#define MIN_BLOCK_SIZE          512
+#define MIN_BLOCK_SIZE_STR      stringify(MIN_BLOCK_SIZE)
+/* upper limit is the max power of 2 that fits in uint16_t */
+#define MAX_BLOCK_SIZE          32768
+#define MAX_BLOCK_SIZE_STR      stringify(MAX_BLOCK_SIZE)
+
 static void set_blocksize(Object *obj, Visitor *v, const char *name,
                           void *opaque, Error **errp)
 {
@@ -736,8 +743,6 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     uint16_t value, *ptr = qdev_get_prop_ptr(dev, prop);
     Error *local_err = NULL;
-    const int64_t min = 512;
-    const int64_t max = 32768;
 
     if (dev->realized) {
         qdev_prop_set_after_realize(dev, name, errp);
@@ -750,9 +755,12 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
         return;
     }
     /* value of 0 means "unset" */
-    if (value && (value < min || value > max)) {
-        error_setg(errp, QERR_PROPERTY_VALUE_OUT_OF_RANGE,
-                   dev->id ? : "", name, (int64_t)value, min, max);
+    if (value && (value < MIN_BLOCK_SIZE || value > MAX_BLOCK_SIZE)) {
+        error_setg(errp,
+                   "Property %s.%s doesn't take value %" PRIu16
+                   " (minimum: " MIN_BLOCK_SIZE_STR
+                   ", maximum: " MAX_BLOCK_SIZE_STR ")",
+                   dev->id ? : "", name, value);
         return;
     }
 
@@ -769,7 +777,8 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
 
 const PropertyInfo qdev_prop_blocksize = {
     .name  = "uint16",
-    .description = "A power of two between 512 and 32768",
+    .description = "A power of two between " MIN_BLOCK_SIZE_STR
+                   " and " MAX_BLOCK_SIZE_STR,
     .get   = get_uint16,
     .set   = set_blocksize,
     .set_default_value = set_default_value_uint,
-- 
2.26.2


