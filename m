Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DF037A39E
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 11:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125662.236524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgi-0003ox-4S; Tue, 11 May 2021 09:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125662.236524; Tue, 11 May 2021 09:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgOgh-0003mB-Uo; Tue, 11 May 2021 09:28:23 +0000
Received: by outflank-mailman (input) for mailman id 125662;
 Tue, 11 May 2021 09:28:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiF3=KG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lgOgf-0003CS-Pm
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 09:28:21 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85060c84-865a-4bc3-9c6f-515465efa1e0;
 Tue, 11 May 2021 09:28:16 +0000 (UTC)
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
X-Inumbo-ID: 85060c84-865a-4bc3-9c6f-515465efa1e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620725296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jiAw2u4kXozSgOauXMnxK9qZm/ervdgw/ztBsqd2eLI=;
  b=OiVYsSK8TKUSFlP5C3uSqoIRcxek28mdL9b65ta7a8gp3UgoChkTmUIL
   hqsab+U4WXR0Vc3nUXIHjolsm895tl4e51Ugyy+UOJQjomwdc78ZSEfMg
   LISyDf48T9dDpNWsHViSyGntkp6OfrZSWNCWNyZZR+9ewggpDILDVD3ZJ
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cbBs2QPmEOmmoXSsPEzkdgREFMXI17afDX3VWPunzRw5ia2Pv/t5ZZ+n53QuxVXafus7Yc2xsE
 elalCSepbXc9ocXLb9UUsJHPe/ZOhHJtYNGXJQHQtVuU+P4qy1I7ieXHdh4nWbBm3xETgQ7vxQ
 U1Hxlvh3Ge8Av5cBnmOWxQPFOVlyn4uFnu9M9SsPzCrLfpz8gkEoM3aBGazP1cAqVYjb6NeGcN
 86E5+XQx5wrHVnfOjX7x706fqTzQWHJWOxtIityel7zpsSHkEkgXFHw0ZudskN77SpWvVHUjG4
 rKk=
X-SBRS: 5.1
X-MesageID: 45044864
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3oOxZahw3hufCEIkGsqYbVu0PnBQX+x13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+OrwdJVoLkmsk6KdjbNhXotKGTOWw1dAT7sSorcKoQeQYhEWn9Q1vc
 wLHskfNDSzNykDsS+T2nj+Lz9K+qjjzEncv5a4854bd3APV0gP1XYaNu+zKDwKeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlAawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontVrcZrau5t+7f63+4oowwbX+0OVjbFaKv6/VGpcmpDS1L9lqq
 iJn/5qBbUI15qYRBDLnfKq4Xin7N9m0Q6d9bfM6UGT0fDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw1hgVyuK4Hy2CrHDE6kbKUNRj+EC2eeMlGcxsRaV2xjIlLH7BJlOy1GkDKp
 giMCjx3ociTbqqVQGugoA0+q3fYp0aJGbzfnQ/
X-IronPort-AV: E=Sophos;i="5.82,290,1613451600"; 
   d="scan'208";a="45044864"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/8] libxl: Replace QEMU's command line short-form boolean option
Date: Tue, 11 May 2021 10:28:04 +0100
Message-ID: <20210511092810.13759-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511092810.13759-1-anthony.perard@citrix.com>
References: <20210511092810.13759-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Short-form boolean options are deprecated in QEMU 6.0.
Upstream commit that deprecate those: ccd3b3b8112b ("qemu-option: warn
for short-form boolean options").

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_dm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 3599a82ef01b..0a0c1ef7c62e 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -977,14 +977,14 @@ static char *dm_spice_options(libxl__gc *gc,
     if (spice->host)
         opt = GCSPRINTF("%s,addr=%s", opt, spice->host);
     if (libxl_defbool_val(spice->disable_ticketing))
-        opt = GCSPRINTF("%s,disable-ticketing", opt);
+        opt = GCSPRINTF("%s,disable-ticketing=on", opt);
     else
         opt = GCSPRINTF("%s,password=%s", opt, spice->passwd);
     opt = GCSPRINTF("%s,agent-mouse=%s", opt,
                     libxl_defbool_val(spice->agent_mouse) ? "on" : "off");
 
     if (!libxl_defbool_val(spice->clipboard_sharing))
-        opt = GCSPRINTF("%s,disable-copy-paste", opt);
+        opt = GCSPRINTF("%s,disable-copy-paste=on", opt);
 
     if (spice->image_compression)
         opt = GCSPRINTF("%s,image-compression=%s", opt,
@@ -1224,7 +1224,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         flexarray_append(dm_args, "-chardev");
         if (state->dm_monitor_fd >= 0) {
             flexarray_append(dm_args,
-                GCSPRINTF("socket,id=libxl-cmd,fd=%d,server,nowait",
+                GCSPRINTF("socket,id=libxl-cmd,fd=%d,server=on,wait=off",
                           state->dm_monitor_fd));
 
             /*
@@ -1237,7 +1237,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         } else {
             flexarray_append(dm_args,
                              GCSPRINTF("socket,id=libxl-cmd,"
-                                       "path=%s,server,nowait",
+                                       "path=%s,server=on,wait=off",
                                        libxl__qemu_qmp_path(gc, guest_domid)));
         }
 
@@ -1247,7 +1247,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         flexarray_append(dm_args, "-chardev");
         flexarray_append(dm_args,
                          GCSPRINTF("socket,id=libxenstat-cmd,"
-                                        "path=%s/qmp-libxenstat-%d,server,nowait",
+                                        "path=%s/qmp-libxenstat-%d,server=on,wait=off",
                                         libxl__run_dir_path(), guest_domid));
 
         flexarray_append(dm_args, "-mon");
@@ -1264,7 +1264,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             case LIBXL_CHANNEL_CONNECTION_SOCKET:
                 path = guest_config->channels[i].u.socket.path;
                 chardev = GCSPRINTF("socket,id=libxl-channel%d,path=%s,"
-                                    "server,nowait", devid, path);
+                                    "server=on,wait=off", devid, path);
                 break;
             default:
                 /* We've forgotten to add the clause */
@@ -1577,7 +1577,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         nics[i].colo_##sock_port) {                                         \
         flexarray_append(dm_args, "-chardev");                              \
         flexarray_append(dm_args,                                           \
-            GCSPRINTF("socket,id=%s,host=%s,port=%s,server,nowait",         \
+            GCSPRINTF("socket,id=%s,host=%s,port=%s,server=on,wait=off",    \
                       nics[i].colo_##sock_id,                               \
                       nics[i].colo_##sock_ip,                               \
                       nics[i].colo_##sock_port));                           \
-- 
Anthony PERARD


