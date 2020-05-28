Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967A51E6DDD
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:40:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQGS-0002xQ-CV; Thu, 28 May 2020 21:40:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leMz=7K=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jeQGR-0002x4-H0
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:40:35 +0000
X-Inumbo-ID: dbf67356-a12b-11ea-a842-12813bfff9fa
Received: from forwardcorp1p.mail.yandex.net (unknown [77.88.29.217])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbf67356-a12b-11ea-a842-12813bfff9fa;
 Thu, 28 May 2020 21:40:34 +0000 (UTC)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 368372E094D;
 Fri, 29 May 2020 00:40:33 +0300 (MSK)
Received: from vla5-58875c36c028.qloud-c.yandex.net
 (vla5-58875c36c028.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:5887:5c36])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 6B27twZHb8-eSfuTBtm; Fri, 29 May 2020 00:40:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590702033; bh=RswyRtwtBWdULttAfpPdwBoW/nGa0Ey4G3dbrsYzIC8=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=KwxoPh7NG4LGf33hEYMh1vMRub1HxR6OQDRFY9c+JmZ0VHWsfr4zRoFButnR8ThP9
 97rZD1y420S4Hmiz9L6aecEAxN435n5FqK13YyO/7OC9QYB7BtiIKh2QHsCg9iYC8c
 A+vHMFWr1pNY1n36DJxND1Jqv1VrEwJ7Ax1j75y0=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by vla5-58875c36c028.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KqoauPPys3-eSXqFT6u; Fri, 29 May 2020 00:40:28 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 6/8] block: make BlockConf size props 32bit and accept size
 suffixes
Date: Fri, 29 May 2020 00:39:44 +0300
Message-Id: <20200528213946.1636444-7-rvkagan@yandex-team.ru>
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

Convert all size-related properties in BlockConf to 32bit.  This will
allow to accomodate bigger block sizes (in a followup patch).
This also allows to make them all accept size suffixes, either via
DEFINE_PROP_BLOCKSIZE or via DEFINE_PROP_SIZE32.

Also, since min_io_size is exposed to the guest by scsi and virtio-blk
devices as an uint16_t in units of logical blocks, introduce an
additional check in blkconf_blocksizes to prevent its silent truncation.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
v6 -> v7:
- split out into separate patch [Eric]
- avoid overflow in min_io_size check [Eric]

 include/hw/block/block.h     | 12 ++++++------
 include/hw/qdev-properties.h |  2 +-
 hw/block/block.c             | 11 +++++++++++
 hw/core/qdev-properties.c    |  4 ++--
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/hw/block/block.h b/include/hw/block/block.h
index 784953a237..1e8b6253dd 100644
--- a/include/hw/block/block.h
+++ b/include/hw/block/block.h
@@ -18,9 +18,9 @@
 
 typedef struct BlockConf {
     BlockBackend *blk;
-    uint16_t physical_block_size;
-    uint16_t logical_block_size;
-    uint16_t min_io_size;
+    uint32_t physical_block_size;
+    uint32_t logical_block_size;
+    uint32_t min_io_size;
     uint32_t opt_io_size;
     int32_t bootindex;
     uint32_t discard_granularity;
@@ -51,9 +51,9 @@ static inline unsigned int get_physical_block_exp(BlockConf *conf)
                           _conf.logical_block_size),                    \
     DEFINE_PROP_BLOCKSIZE("physical_block_size", _state,                \
                           _conf.physical_block_size),                   \
-    DEFINE_PROP_UINT16("min_io_size", _state, _conf.min_io_size, 0),    \
-    DEFINE_PROP_UINT32("opt_io_size", _state, _conf.opt_io_size, 0),    \
-    DEFINE_PROP_UINT32("discard_granularity", _state,                   \
+    DEFINE_PROP_SIZE32("min_io_size", _state, _conf.min_io_size, 0),    \
+    DEFINE_PROP_SIZE32("opt_io_size", _state, _conf.opt_io_size, 0),    \
+    DEFINE_PROP_SIZE32("discard_granularity", _state,                   \
                        _conf.discard_granularity, -1),                  \
     DEFINE_PROP_ON_OFF_AUTO("write-cache", _state, _conf.wce,           \
                             ON_OFF_AUTO_AUTO),                          \
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index c03eadfad6..5252bb6b1a 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -200,7 +200,7 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
 #define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
     DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size32, uint32_t)
 #define DEFINE_PROP_BLOCKSIZE(_n, _s, _f) \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, 0, qdev_prop_blocksize, uint16_t)
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, 0, qdev_prop_blocksize, uint32_t)
 #define DEFINE_PROP_PCI_HOST_DEVADDR(_n, _s, _f) \
     DEFINE_PROP(_n, _s, _f, qdev_prop_pci_host_devaddr, PCIHostDeviceAddress)
 #define DEFINE_PROP_OFF_AUTO_PCIBAR(_n, _s, _f, _d) \
diff --git a/hw/block/block.c b/hw/block/block.c
index b22207c921..7410b24dee 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -96,6 +96,17 @@ bool blkconf_blocksizes(BlockConf *conf, Error **errp)
         return false;
     }
 
+    /*
+     * all devices which support min_io_size (scsi and virtio-blk) expose it to
+     * the guest as a uint16_t in units of logical blocks
+     */
+    if (conf->min_io_size / conf->logical_block_size > UINT16_MAX) {
+        error_setg(errp,
+                   "min_io_size must not exceed " stringify(UINT16_MAX)
+                   " logical blocks");
+        return false;
+    }
+
     if (!QEMU_IS_ALIGNED(conf->opt_io_size, conf->logical_block_size)) {
         error_setg(errp,
                    "opt_io_size must be a multiple of logical_block_size");
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index a79062b428..3cbe3f56a8 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -782,7 +782,7 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
-    uint16_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
     uint64_t value;
     Error *local_err = NULL;
 
@@ -821,7 +821,7 @@ const PropertyInfo qdev_prop_blocksize = {
     .name  = "size",
     .description = "A power of two between " MIN_BLOCK_SIZE_STR
                    " and " MAX_BLOCK_SIZE_STR,
-    .get   = get_uint16,
+    .get   = get_uint32,
     .set   = set_blocksize,
     .set_default_value = set_default_value_uint,
 };
-- 
2.26.2


