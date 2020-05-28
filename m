Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231571E6FC3
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 00:56:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeRRO-0001cY-6T; Thu, 28 May 2020 22:55:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leMz=7K=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jeRRN-0001c9-Gv
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 22:55:57 +0000
X-Inumbo-ID: 5ecdafec-a136-11ea-81bc-bc764e2007e4
Received: from forwardcorp1p.mail.yandex.net (unknown
 [2a02:6b8:0:1472:2741:0:8b6:217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ecdafec-a136-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 22:55:48 +0000 (UTC)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id A877A2E129E;
 Fri, 29 May 2020 01:55:47 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Ui6p83dbCa-tjx8f6bV; Fri, 29 May 2020 01:55:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590706547; bh=U9nHw4Fk6ms5lMxzt8QxxS5p9xmnanon9uS62a1foEw=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=TP7rzzfrRENAsK6DKFYJSj7HqoSTosx8FnwC/AFCXH2C1rXdy4h8ZMZMDdLzOqk4H
 /ofVKIIGjndjR5LyZ9hZCvjKKPHrWvHws3q5moTN61XT9wAaJ/64rmdmiCxURedTtr
 cL6XLXItEaTcvAlZym2nSozlOkEUJ5JEXsb4dzc8=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 tdfEhvD3Vg-tjWSxfhb; Fri, 29 May 2020 01:55:45 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 7/8] qdev-properties: add getter for size32 and blocksize
Date: Fri, 29 May 2020 01:55:15 +0300
Message-Id: <20200528225516.1676602-8-rvkagan@yandex-team.ru>
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

Add getter for size32, and use it for blocksize, too.

In its human-readable branch, it reports approximate size in
human-readable units next to the exact byte value, like the getter for
64bit size does.

Adjust the expected test output accordingly.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/core/qdev-properties.c  |  15 +-
 tests/qemu-iotests/172.out | 530 ++++++++++++++++++-------------------
 2 files changed, 278 insertions(+), 267 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index bd4abdc1d1..63d48db70c 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -730,6 +730,17 @@ const PropertyInfo qdev_prop_pci_devfn = {
 
 /* --- 32bit unsigned int 'size' type --- */
 
+static void get_size32(Object *obj, Visitor *v, const char *name, void *opaque,
+                       Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+    Property *prop = opaque;
+    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
+    uint64_t value = *ptr;
+
+    visit_type_size(v, name, &value, errp);
+}
+
 static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
                        Error **errp)
 {
@@ -763,7 +774,7 @@ static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
 
 const PropertyInfo qdev_prop_size32 = {
     .name  = "size",
-    .get = get_uint32,
+    .get = get_size32,
     .set = set_size32,
     .set_default_value = set_default_value_uint,
 };
@@ -821,7 +832,7 @@ const PropertyInfo qdev_prop_blocksize = {
     .name  = "size",
     .description = "A power of two between " MIN_BLOCK_SIZE_STR
                    " and " MAX_BLOCK_SIZE_STR,
-    .get   = get_uint32,
+    .get   = get_size32,
     .set   = set_blocksize,
     .set_default_value = set_default_value_uint,
 };
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 59cc70aebb..e782c5957e 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -24,11 +24,11 @@ Testing:
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
@@ -54,11 +54,11 @@ Testing: -fda TEST_DIR/t.qcow2
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -81,22 +81,22 @@ Testing: -fdb TEST_DIR/t.qcow2
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
@@ -119,22 +119,22 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -160,11 +160,11 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -187,22 +187,22 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
@@ -225,22 +225,22 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -266,11 +266,11 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global isa-fdc.driveA=none0
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -293,11 +293,11 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global isa-fdc.driveB=none0
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -320,22 +320,22 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -361,11 +361,11 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -388,11 +388,11 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -415,22 +415,22 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -456,22 +456,22 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global is
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -494,22 +494,22 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global is
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -532,11 +532,11 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global is
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -559,11 +559,11 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -global is
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -589,22 +589,22 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -627,22 +627,22 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -665,22 +665,22 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -703,22 +703,22 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "floppy1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -750,22 +750,22 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -788,22 +788,22 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "floppy0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -832,22 +832,22 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -870,22 +870,22 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -908,22 +908,22 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -946,22 +946,22 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none1"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 1 (0x1)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -999,11 +999,11 @@ Testing: -device floppy
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = ""
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
@@ -1026,11 +1026,11 @@ Testing: -device floppy,drive-type=120
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = ""
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "120"
@@ -1053,11 +1053,11 @@ Testing: -device floppy,drive-type=144
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = ""
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -1080,11 +1080,11 @@ Testing: -device floppy,drive-type=288
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = ""
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
@@ -1110,11 +1110,11 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "120"
@@ -1137,11 +1137,11 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "288"
@@ -1167,11 +1167,11 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
@@ -1194,11 +1194,11 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
               dev: floppy, id ""
                 unit = 0 (0x0)
                 drive = "none0"
-                logical_block_size = 512 (0x200)
-                physical_block_size = 512 (0x200)
-                min_io_size = 0 (0x0)
-                opt_io_size = 0 (0x0)
-                discard_granularity = 4294967295 (0xffffffff)
+                logical_block_size = 512 (512 B)
+                physical_block_size = 512 (512 B)
+                min_io_size = 0 (0 B)
+                opt_io_size = 0 (0 B)
+                discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
                 drive-type = "144"
-- 
2.26.2


