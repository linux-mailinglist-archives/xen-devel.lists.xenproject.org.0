Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38BA2F3860
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 19:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65863.116742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOG1-0004fU-8X; Tue, 12 Jan 2021 18:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65863.116742; Tue, 12 Jan 2021 18:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOG1-0004eZ-3E; Tue, 12 Jan 2021 18:19:05 +0000
Received: by outflank-mailman (input) for mailman id 65863;
 Tue, 12 Jan 2021 18:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOBv-0003Yo-0K
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:14:51 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baa42764-ca05-45fb-b71c-b635a6c0f1e4;
 Tue, 12 Jan 2021 18:13:43 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDe8U007695;
 Tue, 12 Jan 2021 19:13:40 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDdjr023609;
 Tue, 12 Jan 2021 19:13:39 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 12B8C7218; Tue, 12 Jan 2021 19:13:39 +0100 (MET)
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
X-Inumbo-ID: baa42764-ca05-45fb-b71c-b635a6c0f1e4
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] libs/light: Switch NetBSD to QEMU_XEN
Date: Tue, 12 Jan 2021 19:12:33 +0100
Message-Id: <20210112181242.1570-13-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:40 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

Switch NetBSD to QEMU_XEN.
All 3 versions of libxl__default_device_model() now return
LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN, so remove it and just set
b_info->device_model_version to LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN in
libxl__domain_build_info_setdefault().

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/libs/light/libxl_create.c   | 2 +-
 tools/libs/light/libxl_freebsd.c  | 5 -----
 tools/libs/light/libxl_internal.h | 2 --
 tools/libs/light/libxl_linux.c    | 5 -----
 tools/libs/light/libxl_netbsd.c   | 5 -----
 5 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 7199a79778..9848d65f36 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -102,7 +102,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
                 b_info->device_model_version =
                     LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
             } else {
-                b_info->device_model_version = libxl__default_device_model(gc);
+                b_info->device_model_version = LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
             }
         } else {
             b_info->device_model_version =
diff --git a/tools/libs/light/libxl_freebsd.c b/tools/libs/light/libxl_freebsd.c
index f7ef4a8910..422c6b3b79 100644
--- a/tools/libs/light/libxl_freebsd.c
+++ b/tools/libs/light/libxl_freebsd.c
@@ -229,11 +229,6 @@ out:
     return rc;
 }
 
-libxl_device_model_version libxl__default_device_model(libxl__gc *gc)
-{
-    return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
-}
-
 int libxl__pci_numdevs(libxl__gc *gc)
 {
     return ERROR_NI;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c79523ba92..6c8b7d71a9 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2309,8 +2309,6 @@ _hidden char *libxl__json_object_to_json(libxl__gc *gc,
   /* Based on /local/domain/$domid/dm-version xenstore key
    * default is qemu xen traditional */
 _hidden int libxl__device_model_version_running(libxl__gc *gc, uint32_t domid);
-  /* Return the system-wide default device model */
-_hidden libxl_device_model_version libxl__default_device_model(libxl__gc *gc);
 
 static inline
 bool libxl__stubdomain_is_linux_running(libxl__gc *gc, uint32_t domid)
diff --git a/tools/libs/light/libxl_linux.c b/tools/libs/light/libxl_linux.c
index 873b0271af..8d62dfd255 100644
--- a/tools/libs/light/libxl_linux.c
+++ b/tools/libs/light/libxl_linux.c
@@ -241,11 +241,6 @@ out:
     return rc;
 }
 
-libxl_device_model_version libxl__default_device_model(libxl__gc *gc)
-{
-    return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
-}
-
 int libxl__pci_numdevs(libxl__gc *gc)
 {
     DIR *dir;
diff --git a/tools/libs/light/libxl_netbsd.c b/tools/libs/light/libxl_netbsd.c
index e66a393d7f..6ad4ed34c2 100644
--- a/tools/libs/light/libxl_netbsd.c
+++ b/tools/libs/light/libxl_netbsd.c
@@ -108,11 +108,6 @@ out:
     return rc;
 }
 
-libxl_device_model_version libxl__default_device_model(libxl__gc *gc)
-{
-    return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
-}
-
 int libxl__pci_numdevs(libxl__gc *gc)
 {
     return ERROR_NI;
-- 
2.29.2


