Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B120537A3A1
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 11:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125663.236532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgi-0003vu-Ij; Tue, 11 May 2021 09:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125663.236532; Tue, 11 May 2021 09:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgi-0003op-BK; Tue, 11 May 2021 09:28:24 +0000
Received: by outflank-mailman (input) for mailman id 125663;
 Tue, 11 May 2021 09:28:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgOgg-0003ke-62
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 09:28:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22332a16-40d8-4b02-b66d-8147fb086ada;
 Tue, 11 May 2021 09:28:19 +0000 (UTC)
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
X-Inumbo-ID: 22332a16-40d8-4b02-b66d-8147fb086ada
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620725299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/Z5o0fCLmaSsMSrYh8CFK3qvyQu5rxrgLPAepK/jeWc=;
  b=Hs29rFC6RGkzL/odGi12nQ7e0RyIoQY7lHk0icUpKrXEzuXA6Kf5MfwS
   ve8DWH1yHlS0INWYq7ETlue7d0gcP8Olp9qfL7XThoRFWwSX/3CxQk+rB
   xC5GpahehBnXojlt5H0uNOxGzskcDa7IDEgXN7Z6dMV9kzAEux+UR6Syc
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WpfxmiJT8DXx6D3rvG677HDsf5LlmX52Dzeyb5yWzo4I7DLG2p0QEyKmkLvnd4d+8AJlyGK2FU
 F+lkIQfHO5nyxotHw93JLYLl3qXuTENC8ItMhlRqQsqxq2zbugnLQYGNT4FjNpB5qlBuisIpTL
 MGSKtiXF2KEA4/Szk4RTeoJS1PVOUeQCBALWSgJOd9vNsklVVrUiczg6lxUFSTsLh57v3Eet7s
 tyVXzlvv9eH4IpXHYzSUzX/r6lssaD9mwuXQOT68vqNUB5FsHLDRYUKwNLlMdIQBHDM6EQXqsL
 zqg=
X-SBRS: 5.1
X-MesageID: 43508703
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8UtQFKkMC4Z+dnqtAc2Yumge+7jpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.82,290,1613451600"; 
   d="scan'208";a="43508703"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 4/8] libxl: Use -device for cd-rom drives
Date: Tue, 11 May 2021 10:28:06 +0100
Message-ID: <20210511092810.13759-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This allows to set an `id` on the device instead of only the drive. We
are going to need the `id` with the "eject" and
"blockdev-change-media" QMP command as using `device` parameter on
those is deprecated. (`device` is the `id` of the `-drive` on the
command line).

We set the same `id` on both -device and -drive as QEMU doesn't
complain and we can then either do "eject id=$id" or "eject
device=$id".

Using "-drive + -device" instead of only "-drive" has been
available since at least QEMU 0.15, and seems to be the preferred way as it
separates the host part (-drive which describe the disk image location
and format) from the guest part (-device which describe the emulated
device). More information in qemu.git/docs/qdev-device-use.txt .

Changing the command line during migration for the cdrom seems fine.
Also the documentation about migration in QEMU explains that the device
state ID is "been formed from a bus name and device address", so
second IDE bus and first device address on bus is still thus and
doesn't matter if written "-drive if=ide,index=2" or "-drive
ide-cd,bus=ide.1,unit=0".
See qemu.git/docs/devel/migration.rst .

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_dm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 0a0c1ef7c62e..5b01cf284163 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1913,6 +1913,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             }
 
             if (disks[i].is_cdrom) {
+                const char *drive_id;
                 if (disk > 4) {
                     LOGD(WARN, guest_domid, "Emulated CDROM can be only one of the first 4 disks.\n"
                          "Disk %s will be available via PV drivers but not as an "
@@ -1920,13 +1921,22 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                          disks[i].vdev);
                     continue;
                 }
-                drive = libxl__sprintf(gc,
-                         "if=ide,index=%d,readonly=on,media=cdrom,id=ide-%i",
-                         disk, dev_number);
+
+                drive_id = GCSPRINTF("ide-%i", dev_number);
+                drive = GCSPRINTF("if=none,readonly=on,id=%s", drive_id);
 
                 if (target_path)
                     drive = libxl__sprintf(gc, "%s,file=%s,format=%s",
                                            drive, target_path, format);
+
+                flexarray_vappend(dm_args,
+                    "-drive", drive,
+                    "-device",
+                    GCSPRINTF("ide-cd,id=%s,drive=%s,bus=ide.%u,unit=%u",
+                              drive_id, drive_id,
+                              disk / 2, disk % 2),
+                    NULL);
+                continue;
             } else {
                 /*
                  * Explicit sd disks are passed through as is.
-- 
Anthony PERARD


