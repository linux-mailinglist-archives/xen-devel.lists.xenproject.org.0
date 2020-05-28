Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D821E6DDB
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:40:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQGI-0002rb-LD; Thu, 28 May 2020 21:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leMz=7K=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jeQGG-0002r3-Mk
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:40:24 +0000
X-Inumbo-ID: d520d756-a12b-11ea-a842-12813bfff9fa
Received: from forwardcorp1j.mail.yandex.net (unknown [5.45.199.163])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d520d756-a12b-11ea-a842-12813bfff9fa;
 Thu, 28 May 2020 21:40:22 +0000 (UTC)
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id BA59E2E0E4D;
 Fri, 29 May 2020 00:40:21 +0300 (MSK)
Received: from vla5-58875c36c028.qloud-c.yandex.net
 (vla5-58875c36c028.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:5887:5c36])
 by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 cApy1ma1ft-eIeujrcV; Fri, 29 May 2020 00:40:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590702021; bh=7tQKIjaOXt/4Y7vYYUMOTnckyEJyyiKNNu3wuyOniCw=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=IyJ61abDZvYdolV88vhvsRf/qW/U9Jap3J3kd6DM7xB7m+T+ajR/cSZy9vxxpNxa2
 ZxymbfVphokM0ohXrOdASuTtNlN1PdAbADJyPpV2CZkMzy2juLJPZeOcM5N3AgbSSK
 PYCYZwm6nmz+tuIaEtq3V6JA4jSnR+uDVG77Scik=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by vla5-58875c36c028.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KqoauPPys3-eHXqcO0n; Fri, 29 May 2020 00:40:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 4/8] qdev-properties: add size32 property type
Date: Fri, 29 May 2020 00:39:42 +0300
Message-Id: <20200528213946.1636444-5-rvkagan@yandex-team.ru>
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

Introduce size32 property type which handles size suffixes (k, m) just
like size property, but is uint32_t rather than uint64_t.  It's going to
be useful for properties that are byte sizes but are inherently 32bit,
like BlkConf.opt_io_size or .discard_granularity (they are switched to
this new property type in a followup commit).

The getter for size32 is left out for a separate patch as its benefit is
less obvious, and it affects test output; for now the regular uint32
getter is used.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
v6 -> v7:
- split out into separate patch [Eric]

 include/hw/qdev-properties.h |  3 +++
 hw/core/qdev-properties.c    | 40 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index f161604fb6..c03eadfad6 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -29,6 +29,7 @@ extern const PropertyInfo qdev_prop_drive;
 extern const PropertyInfo qdev_prop_drive_iothread;
 extern const PropertyInfo qdev_prop_netdev;
 extern const PropertyInfo qdev_prop_pci_devfn;
+extern const PropertyInfo qdev_prop_size32;
 extern const PropertyInfo qdev_prop_blocksize;
 extern const PropertyInfo qdev_prop_pci_host_devaddr;
 extern const PropertyInfo qdev_prop_uuid;
@@ -196,6 +197,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
                         BlockdevOnError)
 #define DEFINE_PROP_BIOS_CHS_TRANS(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_bios_chs_trans, int)
+#define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size32, uint32_t)
 #define DEFINE_PROP_BLOCKSIZE(_n, _s, _f) \
     DEFINE_PROP_UNSIGNED(_n, _s, _f, 0, qdev_prop_blocksize, uint16_t)
 #define DEFINE_PROP_PCI_HOST_DEVADDR(_n, _s, _f) \
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 249dc69bd8..d943755832 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -727,6 +727,46 @@ const PropertyInfo qdev_prop_pci_devfn = {
     .set_default_value = set_default_value_int,
 };
 
+/* --- 32bit unsigned int 'size' type --- */
+
+static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
+                       Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+    Property *prop = opaque;
+    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t value;
+    Error *local_err = NULL;
+
+    if (dev->realized) {
+        qdev_prop_set_after_realize(dev, name, errp);
+        return;
+    }
+
+    visit_type_size(v, name, &value, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (value > UINT32_MAX) {
+        error_setg(errp,
+                   "Property %s.%s doesn't take value %" PRIu64
+                   " (maximum: " stringify(UINT32_MAX) ")",
+                   dev->id ? : "", name, value);
+        return;
+    }
+
+    *ptr = value;
+}
+
+const PropertyInfo qdev_prop_size32 = {
+    .name  = "size",
+    .get = get_uint32,
+    .set = set_size32,
+    .set_default_value = set_default_value_uint,
+};
+
 /* --- blocksize --- */
 
 /* lower limit is sector size */
-- 
2.26.2


