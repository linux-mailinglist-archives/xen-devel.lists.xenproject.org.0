Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9B3696BE
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116485.222335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTS-00086n-Bq; Fri, 23 Apr 2021 16:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116485.222335; Fri, 23 Apr 2021 16:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZyTS-00086L-8j; Fri, 23 Apr 2021 16:16:10 +0000
Received: by outflank-mailman (input) for mailman id 116485;
 Fri, 23 Apr 2021 16:16:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6bT=JU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lZyTQ-00082q-GN
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 16:16:08 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40f9f8eb-a3c7-474f-bd65-2b74a9c96a92;
 Fri, 23 Apr 2021 16:16:03 +0000 (UTC)
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
X-Inumbo-ID: 40f9f8eb-a3c7-474f-bd65-2b74a9c96a92
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619194563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/0JVnuCD1kTyKWnL2fFlRW6M8QY2OnK/3LpLBIlE20A=;
  b=ZD1tStB6+hgq88/ltjY/kt5ZizCrXeiA7SbENSiGpKo8zV9nVGXWQCfg
   4VvUNlVm8krs96JVeD8ZNPwk1hN3TGPWNrDh/hDGDogAznpac0hscXzJm
   jRDD6XSJT02k20WBVV0+FA32JUT7peET+RHYvUWLDtHe5x4ylCXhv3Wi2
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Yzwi6UsWocA/VLpaJrQbN1iu2EfYgRtpVV+2bjL8WP8UdYgsqolJJ2FwlNZlp2Yd+TrgwULUGh
 70GJzeuNBzbNQ/bgO/Vut68y/VJLcCoXoB8Vxhyxy/+bsAIpzz7wsxP268s/QJWWeUkhiR6BBY
 fhaFUfMCC/jCZ0HCJ0NIpOuLGjYUZ8j+TT4OX91GXpNzE2HN6ISSljWJG8Bl9NriiIYjqLPt5U
 wgtQ/HY9uOE/LD8BuWF+yTV/3k4XnVaNcQVHw7a2YxjCLYEp60uivA/hnLH8d0u383+AnonV2e
 8tg=
X-SBRS: 5.1
X-MesageID: 42285499
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9bG+oaGQrfM37lI3pLqFOpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrSxrnlaJdy48XILukQU3aqHKlRbsSibfK7h/BP2nF9uBb3b
 p9aKQWMrfNJHVzkMqS2maFOvk6xt3vys6VrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlFy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6abc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3N2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3ifF6k3b/xsFr1/k1FOCjnPoraXCNUwHIvsEv611WF/9ySMbzbZB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zGJiEtnq8E/pThiS4cEAYUhy7A3zQduP7orOjn104wjGP
 kGNrCn2N9mNWmXaH3UpQBUsaWRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ5yK4A
X-IronPort-AV: E=Sophos;i="5.82,246,1613451600"; 
   d="scan'208";a="42285499"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/8] libxl: Replace QEMU's command line short-form boolean option
Date: Fri, 23 Apr 2021 17:15:52 +0100
Message-ID: <20210423161558.224367-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423161558.224367-1-anthony.perard@citrix.com>
References: <20210423161558.224367-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Short-form boolean options are deprecated in QEMU 6.0.
Upstream commit that deprecate those: ccd3b3b8112b ("qemu-option: warn
for short-form boolean options").

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
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


