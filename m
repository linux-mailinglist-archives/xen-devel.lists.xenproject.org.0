Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAE140B2B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:42:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRqA-0004iv-1p; Fri, 17 Jan 2020 13:39:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cv4k=3G=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1isRq8-0004il-Od
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 13:39:08 +0000
X-Inumbo-ID: b71e67ce-392e-11ea-9fd7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b71e67ce-392e-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579268340;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=exBXhzAbuanYZ2uQgXS6jlXuOvfaj02xkTKmHvNtZJY=;
 b=idDbOte3aWqg5LvzujTAbw7eotHJZK1UlgQROxZNeOffwLUuEwwtXNZ8
 YGravmMx7RrKvZ2fLpvSnWjAUGHM/PksVtmIXlSSAABp6XI47K4D5XmSH
 mLz5tANNDQxwe4JiLzyo3wlA2ED4V0H3kzVN8s8ysMw0UUdKDeIJjPhfm U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tzpuQhHtVieXaTZqmryy7ew6I91O2Llj9OZMLvgMzagtdfZtawPePKEPsrZTt2WDzHVVLr7pD2
 IWwSdZjY3nLIM69mGAfQwk4l+XyL14DKHIW20VG453Cbi1LpHaY62kclYfB/txHW4JVUrboUOh
 YxlCPe99HEdKpJgWsqqZICXZs7KjT6yLG0hU/6wqC3bpa/E2NICWaGdZ5JvsiXpxugau3rgRHS
 s7zDZWTdbaRLVE5TclVF9cJUVbKvJokQ5pHBpfC52HQPSDcB+UkUrBC8m+a3/jeO3x5jco+Pmu
 AHY=
X-SBRS: 2.7
X-MesageID: 11240905
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208,223";a="11240905"
Date: Fri, 17 Jan 2020 13:38:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew <andrew@donehue.net>
Message-ID: <20200117133856.GD1288@perard.uk.xensource.com>
References: <63a86773-8b9c-0634-2157-ea71cb6eff74@donehue.net>
 <CAFLBxZZNnNQHFoLHqWghELMMKYZV4pwGrbDoK7=WgZc1Y5ZV-Q@mail.gmail.com>
 <7ebeddd0-4726-7294-5e31-c05802e50802@donehue.net>
 <20191128104211.GC1155@perard.uk.xensource.com>
 <14702767-e4dd-2fbe-50be-7f5c0737f389@donehue.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8X7/QrJGcKSMr1RN"
Content-Disposition: inline
In-Reply-To: <14702767-e4dd-2fbe-50be-7f5c0737f389@donehue.net>
Subject: Re: [Xen-devel] [Xen-users] 4.13RC3 and PVHVM makes drive drops
 just after boot
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Jan 04, 2020 at 10:24:37PM +1000, Andrew wrote:
> Hi Anthony,
> 
> 
> I have been trying to keep an eye on the mailing list, but I might have
> missed it. Do you mind if I ask if you had any luck with the below (and/or
> if there is a subject line or content I should be keeping an eye on to see
> if a patch has been released so we can re-test?)

CCing xen-devel

Hi Andrew,

Sorry, I haven't sent anything yet.

I've managed to workaround one part of the problem, but when I test it
with an nbd backend, my patch isn't enought. But it might work with
Ceph/rbd., I've attatch a patch that you could try.

The issue it that now QEMU wants to connect twice at the same time to
the backend (rbd, nbd) for the same disk. There were only one connection
at a time before, most of the time.

Cheers,

-- 
Anthony PERARD

--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment;
	filename="0001-xen-block-Fix-parsing-of-legacy-options.patch"

From 1b8d700007f1f8709a6ef1960111ea022cfb6d74 Mon Sep 17 00:00:00 2001
From: Anthony PERARD <anthony.perard@citrix.com>
Date: Fri, 17 Jan 2020 12:05:09 +0000
Subject: [PATCH] xen-block: Fix parsing of legacy options

Even though the xen-disk PV backend can be instantiated via QMP, we
still need to handle the case where the backend is created via
xenstore. This means that we need to be able to parse legacy disk
options such as "aio:nbd://host:1234/disk".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 block.c                        |  6 ++++++
 hw/block/xen-block.c           | 25 +++++++++++++++++++++----
 include/sysemu/block-backend.h |  3 +++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index ecd09dbbfd89..13b8690e5006 100644
--- a/block.c
+++ b/block.c
@@ -1705,6 +1705,12 @@ static int bdrv_fill_options(QDict **options, const char *filename,
 
     return 0;
 }
+int bdrv_fill_options_legacy(QDict **options, const char *filename,
+                             int *flags, Error **errp)
+{
+    return bdrv_fill_options(options, filename, flags, errp);
+}
+
 
 static int bdrv_child_check_perm(BdrvChild *c, BlockReopenQueue *q,
                                  uint64_t perm, uint64_t shared,
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 879fc310a4c5..1cc97a001e1f 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -28,6 +28,7 @@
 #include "sysemu/iothread.h"
 #include "dataplane/xen-block.h"
 #include "trace.h"
+#include "include/block/qdict.h"
 
 static char *xen_block_get_name(XenDevice *xendev, Error **errp)
 {
@@ -687,7 +688,12 @@ static char *xen_block_blockdev_add(const char *id, QDict *qdict,
 
     trace_xen_block_blockdev_add(node_name);
 
-    v = qobject_input_visitor_new(QOBJECT(qdict));
+    qdict_flatten(qdict);
+    v = qobject_input_visitor_new_flat_confused(qdict, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        goto fail;
+    }
     visit_type_BlockdevOptions(v, NULL, &options, &local_err);
     visit_free(v);
 
@@ -782,8 +788,14 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     file_layer = qdict_new();
     driver_layer = qdict_new();
 
-    qdict_put_str(file_layer, "driver", "file");
-    qdict_put_str(file_layer, "filename", filename);
+    int flags = BDRV_O_PROTOCOL | BDRV_O_RDWR;
+    if (mode && *mode != 'w') {
+        flags &= ~BDRV_O_RDWR;
+    }
+    bdrv_fill_options_legacy(&file_layer, filename, &flags, &local_err);
+    if (local_err)
+        goto done;
+
     g_free(filename);
 
     if (mode && *mode != 'w') {
@@ -816,7 +828,12 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
      * It is necessary to turn file locking off as an emulated device
      * may have already opened the same image file.
      */
-    qdict_put_str(file_layer, "locking", "off");
+    const char *file_driver = qdict_get_str(file_layer, "driver");
+    if (!strcmp("file", file_driver) ||
+        !strcmp("host_device", file_driver) ||
+        !strcmp("host_cdrom", file_driver)
+        )
+        qdict_put_str(file_layer, "locking", "off");
 
     qdict_put_str(driver_layer, "driver", driver);
     g_free(driver);
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index b198deca0b24..93efded0ab61 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -98,6 +98,9 @@ void blk_remove_bs(BlockBackend *blk);
 int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp);
 bool bdrv_has_blk(BlockDriverState *bs);
 bool bdrv_is_root_node(BlockDriverState *bs);
+/* deprecated, not to be used for new backends */
+int bdrv_fill_options_legacy(QDict **options, const char *filename,
+                             int *flags, Error **errp);
 int blk_set_perm(BlockBackend *blk, uint64_t perm, uint64_t shared_perm,
                  Error **errp);
 void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t *shared_perm);
-- 
Anthony PERARD


--8X7/QrJGcKSMr1RN
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8X7/QrJGcKSMr1RN--

