Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5971058C734
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 13:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382390.617337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL0a9-0006Hp-6h; Mon, 08 Aug 2022 11:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382390.617337; Mon, 08 Aug 2022 11:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oL0a9-0006EZ-3V; Mon, 08 Aug 2022 11:06:01 +0000
Received: by outflank-mailman (input) for mailman id 382390;
 Mon, 08 Aug 2022 11:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MrjU=YM=citrix.com=prvs=2124ac30a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oL0a8-0005ep-79
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 11:06:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14ef6f74-170a-11ed-bd2e-47488cf2e6aa;
 Mon, 08 Aug 2022 13:05:58 +0200 (CEST)
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
X-Inumbo-ID: 14ef6f74-170a-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659956758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UoENNw6Pj7pjKh3ByeuEJ7KwsY4w8czj33URcS8/NGA=;
  b=KOS+1qq/3as92JhsQBJh/o4xDy9HnAya4lUxpc+Y7wNtRRqVY1aqw53V
   Yl1aHojop+0DI2yPJtxGM8NVH48Dk3PH79qSxdZ5P6LgZGnJlBQC5NwgJ
   yv68VFzH1RtWBESH24XCepiOjyVCWGXi/yJo3MSn0UDKzh8F77voTLgZ8
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80148087
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CwDuWKsCf8yaYibt4mSbcJsd3efnVCheMUV32f8akzHdYApBsoF/q
 tZmKW6Ea//YZ2P9f4h0aom//U4A6pfTx9VhGwJkpHg0Qy8X+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4GNA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYInuaF3GDgQz
 vE/cjQjdDuOqrOa8YvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3FYIKMJozSFZo9ckCwp
 EXU+l3lJjEhFN2zzSGr7Xj2j6jopHauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24ma8VMhYM
 Fc84Tc1oO4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby9bc48Yzl0uRddtESqqblPb4NGDc8
 gnf+UDSmI4vYd43O7STpA6a0mzy+8eQEmbZ9S2MADv7s1oRiJqNItXxtAOFtasowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWN4umgWyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4m0BqGLNYUfOscqHONiwM2JTR744owQuBJ0zfFX1
 WmzK65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eK0XOy+PiOPGDFbIGOhtDbd7RrpmhE9yiFmKr
 o032grj40k3bdASlQGOrdZNdQxSfCZT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:3bema65sovSyJ/eITAPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HLoB17726TtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpAEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.93,222,1654574400"; 
   d="scan'208";a="80148087"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH 2/2] tools/libxl: Replace deprecated -soundhw on QEMU command line
Date: Mon, 8 Aug 2022 12:05:45 +0100
Message-ID: <20220808110545.62886-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808110545.62886-1-anthony.perard@citrix.com>
References: <20220808110545.62886-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-soundhw is deprecated since 825ff02911c9 ("audio: add soundhw
deprecation notice"), QEMU v5.1, and is been remove for upcoming v7.1
by 039a68373c45 ("introduce -audio as a replacement for -soundhw").

Instead we can just add the sound card with "-device", for most option
that "-soundhw" could handle. "-device" is an option that existed
before QEMU 1.0, and could already be used to add audio hardware.

The list of possible option for libxl's "soundhw" is taken the list
from QEMU 7.0.

The list of options for "soundhw" are listed in order of preference in
the manual. The first three (hda, ac97, es1370) are PCI devices and
easy to test on Linux, and the last four are ISA devices which doesn't
seems to work out of the box on linux.

The sound card 'pcspk' isn't listed even if it used to be accepted by
'-soundhw' because QEMU crash when trying to add it to a Xen domain.
Also, it wouldn't work with "-device" might need to be "-machine
pcspk-audiodev=default" instead.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 docs/man/xl.cfg.5.pod.in                  |  6 +++---
 tools/libs/light/libxl_types_internal.idl | 10 ++++++++++
 tools/libs/light/libxl_dm.c               | 19 ++++++++++++++++++-
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 6d98d73d76..b2901e04cf 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2555,9 +2555,9 @@ The form serial=DEVICE is also accepted for backwards compatibility.
 
 =item B<soundhw="DEVICE">
 
-Select the virtual sound card to expose to the guest. The valid
-devices are defined by the device model configuration, please see the
-B<qemu(1)> manpage for details. The default is not to export any sound
+Select the virtual sound card to expose to the guest. The valid devices are
+B<hda>, B<ac97>, B<es1370>, B<adlib>, B<cs4231a>, B<gus>, B<sb16> if there are
+available with the device model QEMU. The default is not to export any sound
 device.
 
 =item B<vkb_device=BOOLEAN>
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index 8f71980aec..fb0f4f23d7 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -56,3 +56,13 @@ libxl__device_action = Enumeration("device_action", [
     (1, "ADD"),
     (2, "REMOVE"),
     ])
+
+libxl__qemu_soundhw = Enumeration("qemu_soundhw", [
+    (1, "ac97"),
+    (2, "adlib"),
+    (3, "cs4231a"),
+    (4, "es1370"),
+    (5, "gus"),
+    (6, "hda"),
+    (7, "sb16"),
+    ])
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 04bf5d8563..fc264a3a13 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1204,6 +1204,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     uint64_t ram_size;
     const char *path, *chardev;
     bool is_stubdom = libxl_defbool_val(b_info->device_model_stubdomain);
+    int rc;
 
     dm_args = flexarray_make(gc, 16, 1);
     dm_envs = flexarray_make(gc, 16, 1);
@@ -1531,7 +1532,23 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             }
         }
         if (b_info->u.hvm.soundhw) {
-            flexarray_vappend(dm_args, "-soundhw", b_info->u.hvm.soundhw, NULL);
+            libxl__qemu_soundhw soundhw;
+
+            rc = libxl__qemu_soundhw_from_string(b_info->u.hvm.soundhw, &soundhw);
+            if (rc) {
+                LOGD(ERROR, guest_domid, "Unknown soundhw option '%s'", b_info->u.hvm.soundhw);
+                return ERROR_INVAL;
+            }
+
+            switch (soundhw) {
+            case LIBXL__QEMU_SOUNDHW_HDA:
+                flexarray_vappend(dm_args, "-device", "intel-hda",
+                                  "-device", "hda-duplex", NULL);
+                break;
+            default:
+                flexarray_append_pair(dm_args, "-device",
+                                      (char*)libxl__qemu_soundhw_to_string(soundhw));
+            }
         }
         if (!libxl__acpi_defbool_val(b_info)) {
             flexarray_append(dm_args, "-no-acpi");
-- 
Anthony PERARD


