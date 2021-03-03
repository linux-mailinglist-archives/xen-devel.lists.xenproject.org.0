Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3774132ACCC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 02:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92652.174700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGbN-00008G-Tf; Wed, 03 Mar 2021 01:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92652.174700; Wed, 03 Mar 2021 01:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGbN-00007c-OF; Wed, 03 Mar 2021 01:47:01 +0000
Received: by outflank-mailman (input) for mailman id 92652;
 Wed, 03 Mar 2021 01:46:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHGbL-000841-Qj
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 01:46:59 +0000
Received: from mail-qv1-xf33.google.com (unknown [2607:f8b0:4864:20::f33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f23ca88d-6216-4410-ad20-87b8e4b930a4;
 Wed, 03 Mar 2021 01:46:32 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id h7so4011913qvm.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Mar 2021 17:46:32 -0800 (PST)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 g21sm5406145qkk.72.2021.03.02.17.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:46:31 -0800 (PST)
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
X-Inumbo-ID: f23ca88d-6216-4410-ad20-87b8e4b930a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=nx6R5ORiCtnIpFZu+0txlPDpQ866FHk77wANc0bUqAI=;
        b=LiowHAHaHUAMpdlFR0qN7G4RMqMen6UvaUK6BX6rUY4JwiopRGc7CZbG/aDy/Xo+tY
         XOn5Qd/XdN78psWXxdDDoEXbBBcJmTUrO7ZjXb9/7VVKsusuEbvK8ezE3zqmeqQ/dBA0
         maavLGertJurfR37hh0xN4KQw6z7KgOL8kdWwJmUgSS79DuSJG0hLtbb+G/TceGwlYEp
         jhYi5iNa9Yj/xbKb4XsZkKI3mDvlZsxNYgK89YTEvAWFvTwQRlpDMV6Fagb47uBvmeJ+
         hyHkpZjCkph4o5A1Nn2bReSl3U837VyStkFsI1AUweSEvB+1DLXnrIWqMuczBFgZwtfy
         JxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=nx6R5ORiCtnIpFZu+0txlPDpQ866FHk77wANc0bUqAI=;
        b=hE1vaHLu+DDuSTbgpa2/V1ygAoaMDFOwSMD0qP/leYtlafdCd+/DojOOe7L5Ytl7Ju
         8toky+i4GvpZayXvRimMUmcyIn3SQGWOmsslK5Sm/h2RNCq/yobcf+nwZ8oOESmdxoJg
         E0ASTVTMLZo0a3kjg1Lk/8FW0XSkHS/LLTapNBE3fTURnmCjyjT4H6daTCNoPkTHEndK
         x9mmNa7OGi4kc/LP5eB+BlEi8Afj7Etsyn/tOj0acon5ffbU2IhwGilyi/PkvQcDcTUn
         7G2gKyZGnvUpb7V33C1kJVwSnLj7zPOaaWeVBI/Rw/uKmfUFdOXQYKFgoSBtF6n+3KBu
         s24w==
X-Gm-Message-State: AOAM5316phAANeDKaUYgZuLY63sXTSTFnuYMGUHv+XviDtgcMjAojA7I
	5fwksXzbOJ0SZg1Bxn81LLkoqrPIk/vs4g==
X-Google-Smtp-Source: ABdhPJw2+E75L/amcMYxB7PZVpDwE8JFQsGQc6/m+RgVKVFczfaVYlCvkNM5ek6oh86zQpbK4Vne1w==
X-Received: by 2002:a0c:be86:: with SMTP id n6mr22740714qvi.61.1614735991489;
        Tue, 02 Mar 2021 17:46:31 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 7/7] libxl: replace LIBXL_DEFINE_DEVICE* macro usage with generated code
Date: Tue,  2 Mar 2021 20:46:19 -0500
Message-Id: <25b500b54881b8ff3e86c7da5b8a977884471b01.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>

Allow the gentypes.py script to write generated function output to
_libxl_types.c, and remove the LIBXL_DEFINE_DEVICE* macro calls in the
appropriate locations.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---

Note: This commit does not build; there is more work to be done,
particularly around accessing libxl__device_from* functions, as well as
libxl__device_<type>_add functions.
---
 tools/libs/light/gentypes.py     | 8 +++++---
 tools/libs/light/libxl_9pfs.c    | 2 --
 tools/libs/light/libxl_console.c | 2 --
 tools/libs/light/libxl_disk.c    | 2 --
 tools/libs/light/libxl_nic.c     | 2 --
 tools/libs/light/libxl_pvcalls.c | 2 --
 tools/libs/light/libxl_usb.c     | 3 ---
 tools/libs/light/libxl_vdispl.c  | 2 --
 tools/libs/light/libxl_vkb.c     | 1 -
 tools/libs/light/libxl_vsnd.c    | 2 --
 tools/libs/light/libxl_vtpm.c    | 2 --
 11 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index 9f1856399a..5b72b4613e 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -874,12 +874,14 @@ if __name__ == '__main__':
         f.write("\n")
 
     for func in funcs:
+        f.write("\n")
+
         if type(func) is idl.DeviceAddFunction:
-            _ = libxl_func_define_device_add(func)
+            f.write(libxl_func_define_device_add(func))
         elif type(func) is idl.DeviceRemoveFunction:
-            _ = libxl_func_define_device_remove(func)
+            f.write(libxl_func_define_device_remove(func))
         elif type(func) is idl.DeviceDestroyFunction:
-            _ = libxl_func_define_device_destroy(func)
+            f.write(libxl_func_define_device_destroy(func))
         else:
             raise Exception("Unexpected Function class %s" % type(func))
 
diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
index 5ab0d3aa21..f4875ea996 100644
--- a/tools/libs/light/libxl_9pfs.c
+++ b/tools/libs/light/libxl_9pfs.c
@@ -43,8 +43,6 @@ static int libxl__set_xenstore_p9(libxl__gc *gc, uint32_t domid,
 static LIBXL_DEFINE_UPDATE_DEVID(p9)
 static LIBXL_DEFINE_DEVICE_FROM_TYPE(p9)
 
-LIBXL_DEFINE_DEVICE_REMOVE(p9)
-
 DEFINE_DEVICE_TYPE_STRUCT(p9, 9PFS, p9s,
     .skip_attach = 1,
     .set_xenstore_config = (device_set_xenstore_config_fn_t)
diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index d8b2bc5465..726bee3b16 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -723,8 +723,6 @@ static LIBXL_DEFINE_UPDATE_DEVID(vfb)
 static LIBXL_DEFINE_DEVICE_FROM_TYPE(vfb)
 
 /* vfb */
-LIBXL_DEFINE_DEVICE_REMOVE(vfb)
-
 DEFINE_DEVICE_TYPE_STRUCT(vfb, VFB, vfbs,
     .skip_attach = 1,
     .set_xenstore_config = (device_set_xenstore_config_fn_t)
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 411ffeaca6..16d2667d3a 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -1320,9 +1320,7 @@ out:
  * libxl_device_disk_destroy
  * libxl_device_disk_safe_remove
  */
-LIBXL_DEFINE_DEVICE_ADD(disk)
 LIBXL_DEFINE_DEVICES_ADD(disk)
-LIBXL_DEFINE_DEVICE_REMOVE(disk)
 LIBXL_DEFINE_DEVICE_SAFE_REMOVE(disk)
 
 static int libxl_device_disk_compare(const libxl_device_disk *d1,
diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index 0b45469dca..f77e1a07a5 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -525,9 +525,7 @@ static LIBXL_DEFINE_UPDATE_DEVID(nic)
 static LIBXL_DEFINE_DEVICE_FROM_TYPE(nic)
 
 LIBXL_DEFINE_DEVID_TO_DEVICE(nic)
-LIBXL_DEFINE_DEVICE_ADD(nic)
 LIBXL_DEFINE_DEVICES_ADD(nic)
-LIBXL_DEFINE_DEVICE_REMOVE(nic)
 
 DEFINE_DEVICE_TYPE_STRUCT(nic, VIF, nics,
     .update_config = libxl_device_nic_update_config,
diff --git a/tools/libs/light/libxl_pvcalls.c b/tools/libs/light/libxl_pvcalls.c
index 1fbedf651c..6816cc3d4d 100644
--- a/tools/libs/light/libxl_pvcalls.c
+++ b/tools/libs/light/libxl_pvcalls.c
@@ -32,6 +32,4 @@ static LIBXL_DEFINE_DEVICE_FROM_TYPE(pvcallsif)
 #define libxl_device_pvcallsif_list NULL
 #define libxl_device_pvcallsif_compare NULL
 
-LIBXL_DEFINE_DEVICE_REMOVE(pvcallsif)
-
 DEFINE_DEVICE_TYPE_STRUCT(pvcallsif, PVCALLS, pvcallsifs);
diff --git a/tools/libs/light/libxl_usb.c b/tools/libs/light/libxl_usb.c
index c5ae59681c..af5230b261 100644
--- a/tools/libs/light/libxl_usb.c
+++ b/tools/libs/light/libxl_usb.c
@@ -547,9 +547,7 @@ static void device_usbctrl_add_done(libxl__egc *egc,
     aodev->callback(egc, aodev);
 }
 
-LIBXL_DEFINE_DEVICE_ADD(usbctrl)
 static LIBXL_DEFINE_DEVICES_ADD(usbctrl)
-LIBXL_DEFINE_DEVICE_REMOVE_CUSTOM(usbctrl)
 
 static int libxl__device_usbdev_list_for_usbctrl(libxl__gc *gc, uint32_t domid,
                                                  libxl_devid usbctrl,
@@ -1865,7 +1863,6 @@ static void device_usbdev_add_done(libxl__egc *egc,
     aodev->callback(egc, aodev);
 }
 
-LIBXL_DEFINE_DEVICE_ADD(usbdev)
 static LIBXL_DEFINE_DEVICES_ADD(usbdev)
 
 static void device_usbdev_remove_timeout(libxl__egc *egc,
diff --git a/tools/libs/light/libxl_vdispl.c b/tools/libs/light/libxl_vdispl.c
index 60427c76c2..13b6c2be99 100644
--- a/tools/libs/light/libxl_vdispl.c
+++ b/tools/libs/light/libxl_vdispl.c
@@ -202,8 +202,6 @@ static LIBXL_DEFINE_UPDATE_DEVID(vdispl)
 static LIBXL_DEFINE_DEVICES_ADD(vdispl)
 
 LIBXL_DEFINE_DEVID_TO_DEVICE(vdispl)
-LIBXL_DEFINE_DEVICE_ADD(vdispl)
-LIBXL_DEFINE_DEVICE_REMOVE(vdispl)
 LIBXL_DEFINE_DEVICE_LIST(vdispl)
 
 DEFINE_DEVICE_TYPE_STRUCT(vdispl, VDISPL, vdispls,
diff --git a/tools/libs/light/libxl_vkb.c b/tools/libs/light/libxl_vkb.c
index bb88059f93..5b552c262f 100644
--- a/tools/libs/light/libxl_vkb.c
+++ b/tools/libs/light/libxl_vkb.c
@@ -334,7 +334,6 @@ static LIBXL_DEFINE_UPDATE_DEVID(vkb)
 #define libxl_device_vkb_compare NULL
 
 LIBXL_DEFINE_DEVICE_LIST(vkb)
-LIBXL_DEFINE_DEVICE_REMOVE(vkb)
 
 DEFINE_DEVICE_TYPE_STRUCT(vkb, VKBD, vkbs,
     .skip_attach = 1,
diff --git a/tools/libs/light/libxl_vsnd.c b/tools/libs/light/libxl_vsnd.c
index bb7942bbc9..16f448c74e 100644
--- a/tools/libs/light/libxl_vsnd.c
+++ b/tools/libs/light/libxl_vsnd.c
@@ -666,8 +666,6 @@ out:
 static LIBXL_DEFINE_UPDATE_DEVID(vsnd)
 static LIBXL_DEFINE_DEVICES_ADD(vsnd)
 
-LIBXL_DEFINE_DEVICE_ADD(vsnd)
-LIBXL_DEFINE_DEVICE_REMOVE(vsnd)
 LIBXL_DEFINE_DEVICE_LIST(vsnd)
 
 DEFINE_DEVICE_TYPE_STRUCT(vsnd, VSND, vsnds,
diff --git a/tools/libs/light/libxl_vtpm.c b/tools/libs/light/libxl_vtpm.c
index 0148c572d4..8dcc965860 100644
--- a/tools/libs/light/libxl_vtpm.c
+++ b/tools/libs/light/libxl_vtpm.c
@@ -227,8 +227,6 @@ static LIBXL_DEFINE_UPDATE_DEVID(vtpm)
 static LIBXL_DEFINE_DEVICE_FROM_TYPE(vtpm)
 static LIBXL_DEFINE_DEVICES_ADD(vtpm)
 
-LIBXL_DEFINE_DEVICE_ADD(vtpm)
-LIBXL_DEFINE_DEVICE_REMOVE(vtpm)
 LIBXL_DEFINE_DEVICE_LIST(vtpm)
 
 DEFINE_DEVICE_TYPE_STRUCT(vtpm, VTPM, vtpms,
-- 
2.17.1


