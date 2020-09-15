Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F3D26A6D7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 16:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIBex-00049V-Pf; Tue, 15 Sep 2020 14:10:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OlW=CY=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kIBew-00048m-JW
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 14:10:14 +0000
X-Inumbo-ID: 4d8b9e30-d83b-49a2-87f5-a4845e5ea7c0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d8b9e30-d83b-49a2-87f5-a4845e5ea7c0;
 Tue, 15 Sep 2020 14:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=ryPp6biZhlA0OR8xQd0IBm192OtL9Vdn6aBG28xgWUM=; b=YKCkjQNVDPgmhumYFzNMhrIeUr
 A4WsDlCbHKkP4/ay0uQG6HWZKdOKvTVLOA544RsX/hQpXaApGp9yJrNv7hylejBHg4id/LsSBLNQP
 knbqV8aezKPKE7wA/JPsf9rpvS5p4Mw7FbNORSWJk+NG2JXHxc8UYoBpjH0QYtHgQZIk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIBes-0003nQ-Mr; Tue, 15 Sep 2020 14:10:10 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kIBes-0001rP-CR; Tue, 15 Sep 2020 14:10:10 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 1/2] libxl: provide a mechanism to define a device 'safe
 remove' function...
Date: Tue, 15 Sep 2020 15:10:06 +0100
Message-Id: <20200915141007.25965-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200915141007.25965-1-paul@xen.org>
References: <20200915141007.25965-1-paul@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

... and use it to define libxl_device_disk_safe_remove().

This patch builds on the existent macro magic by using a new value of the
'force' field in in libxl__ao_device.
It is currently defined as an int but is used in a boolean manner where
1 means the operation is forced and 0 means it is not (but is actually forced
after a 10s time-out). In adding a third value, this patch re-defines 'force'
as a struct type (libxl__force) with a single 'flag' field taking an
enumerated value:

LIBXL__FORCE_AUTO - corresponding to the old 0 value
LIBXL__FORCE_ON   - corresponding to the old 1 value
LIBXL__FORCE_OFF  - the new value

The LIBXL_DEFINE_DEVICE_REMOVE() macro is then modified to define the
libxl_device_<type>_remove() and libxl_device_<type>_destroy() functions,
setting LIBXL__FORCE_AUTO and LIBXL__FORCE_ON (respectively) in the
libxl__ao_device passed to libxl__initiate_device_generic_remove() and a
new macro, LIBXL_DEFINE_DEVICE_SAFE_REMOVE(), is defined that sets
LIBXL__FORCE_OFF instead. This macro is used to define the new
libxl_device_disk_safe_remove() function.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v2:
 - New in v2
---
 tools/libxl/libxl.h          | 33 +++++++++++++++++++++++++--------
 tools/libxl/libxl_device.c   |  9 +++++----
 tools/libxl/libxl_disk.c     |  4 +++-
 tools/libxl/libxl_domain.c   |  2 +-
 tools/libxl/libxl_internal.h | 30 +++++++++++++++++++++++-------
 5 files changed, 57 insertions(+), 21 deletions(-)

diff --git a/tools/libxl/libxl.h b/tools/libxl/libxl.h
index 1cd6c38e83..1ea5b4f446 100644
--- a/tools/libxl/libxl.h
+++ b/tools/libxl/libxl.h
@@ -438,6 +438,12 @@
  */
 #define LIBXL_HAVE_CREATEINFO_PASSTHROUGH 1
 
+/*
+ * LIBXL_HAVE_DISK_SAFE_REMOVE indicates that the
+ * libxl_device_disk_safe_remove() function is defined.
+ */
+#define LIBXL_HAVE_DISK_SAFE_REMOVE 1
+
 /*
  * libxl ABI compatibility
  *
@@ -1936,6 +1942,15 @@ void libxl_vcpuinfo_list_free(libxl_vcpuinfo *, int nr_vcpus);
  *   structure is passed in are filled in with appropriate values for
  *   the device created.
  *
+ * libxl_device_<type>_destroy(ctx, domid, device):
+ *
+ *   Removes the given device from the specified domain without guest
+ *   co-operation. It is guest specific what affect this will have on
+ *   a running guest.
+ *
+ *   This function does not interact with the guest and therefore
+ *   cannot block on the guest.
+ *
  * libxl_device_<type>_remove(ctx, domid, device):
  *
  *   Removes the given device from the specified domain by performing
@@ -1943,16 +1958,14 @@ void libxl_vcpuinfo_list_free(libxl_vcpuinfo *, int nr_vcpus);
  *   guest is running.
  *
  *   This method is currently synchronous and therefore can block
- *   while interacting with the guest.
- *
- * libxl_device_<type>_destroy(ctx, domid, device):
+ *   while interacting with the guest. There is a time-out of 10s on
+ *   this interaction after which libxl_device_<type>_destroy()
+ *   semantics apply.
  *
- *   Removes the given device from the specified domain without guest
- *   co-operation. It is guest specific what affect this will have on
- *   a running guest.
+ * libxl_device_<type>_safe_remove(ctx, domid, device):
  *
- *   This function does not interact with the guest and therefore
- *   cannot block on the guest.
+ *   This has the same semantics as libxl_device_<type>_remove() but,
+ *   in the event of hitting the 10s time-out, this function will fail.
  *
  * Controllers
  * -----------
@@ -2033,6 +2046,10 @@ int libxl_device_disk_destroy(libxl_ctx *ctx, uint32_t domid,
                               libxl_device_disk *disk,
                               const libxl_asyncop_how *ao_how)
                               LIBXL_EXTERNAL_CALLERS_ONLY;
+int libxl_device_disk_safe_remove(libxl_ctx *ctx, uint32_t domid,
+                                  libxl_device_disk *disk,
+                                  const libxl_asyncop_how *ao_how)
+                                  LIBXL_EXTERNAL_CALLERS_ONLY;
 
 libxl_device_disk *libxl_device_disk_list(libxl_ctx *ctx,
                                           uint32_t domid, int *num)
diff --git a/tools/libxl/libxl_device.c b/tools/libxl/libxl_device.c
index 0381c5d509..e081faf9a9 100644
--- a/tools/libxl/libxl_device.c
+++ b/tools/libxl/libxl_device.c
@@ -973,7 +973,7 @@ void libxl__initiate_device_generic_remove(libxl__egc *egc,
             goto out;
         }
 
-        if (aodev->force)
+        if (aodev->force.flag == LIBXL__FORCE_ON)
             libxl__xs_path_cleanup(gc, t,
                                    libxl__device_frontend_path(gc, aodev->dev));
 
@@ -1092,9 +1092,9 @@ static void device_backend_callback(libxl__egc *egc, libxl__ev_devstate *ds,
 
     if (rc == ERROR_TIMEDOUT &&
         aodev->action == LIBXL__DEVICE_ACTION_REMOVE &&
-        !aodev->force) {
+        aodev->force.flag == LIBXL__FORCE_AUTO) {
         LOGD(DEBUG, aodev->dev->domid, "Timeout reached, initiating forced remove");
-        aodev->force = 1;
+        aodev->force.flag = LIBXL__FORCE_ON;
         libxl__initiate_device_generic_remove(egc, aodev);
         return;
     }
@@ -1319,7 +1319,8 @@ static void device_hotplug_done(libxl__egc *egc, libxl__ao_device *aodev)
     device_hotplug_clean(gc, aodev);
 
     /* Clean xenstore if it's a disconnection */
-    if (aodev->action == LIBXL__DEVICE_ACTION_REMOVE) {
+    if (aodev->action == LIBXL__DEVICE_ACTION_REMOVE &&
+        (aodev->force.flag == LIBXL__FORCE_ON || !aodev->rc)) {
         rc = libxl__device_destroy(gc, aodev->dev);
         if (!aodev->rc)
             aodev->rc = rc;
diff --git a/tools/libxl/libxl_disk.c b/tools/libxl/libxl_disk.c
index ddc1eec176..de183e0fb0 100644
--- a/tools/libxl/libxl_disk.c
+++ b/tools/libxl/libxl_disk.c
@@ -1277,7 +1277,7 @@ void libxl__device_disk_local_initiate_detach(libxl__egc *egc,
         aodev->action = LIBXL__DEVICE_ACTION_REMOVE;
         aodev->dev = device;
         aodev->callback = local_device_detach_cb;
-        aodev->force = 0;
+        aodev->force.flag = LIBXL__FORCE_AUTO;
         libxl__initiate_device_generic_remove(egc, aodev);
         return;
     }
@@ -1318,10 +1318,12 @@ out:
  * libxl__add_disks
  * libxl_device_disk_remove
  * libxl_device_disk_destroy
+ * libxl_device_disk_safe_remove
  */
 LIBXL_DEFINE_DEVICE_ADD(disk)
 LIBXL_DEFINE_DEVICES_ADD(disk)
 LIBXL_DEFINE_DEVICE_REMOVE(disk)
+LIBXL_DEFINE_DEVICE_SAFE_REMOVE(disk)
 
 static int libxl_device_disk_compare(const libxl_device_disk *d1,
                                      const libxl_device_disk *d2)
diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
index 39f08a6519..5d4ec90711 100644
--- a/tools/libxl/libxl_domain.c
+++ b/tools/libxl/libxl_domain.c
@@ -1279,7 +1279,7 @@ static void dm_destroy_cb(libxl__egc *egc,
     dis->drs.ao = ao;
     dis->drs.domid = domid;
     dis->drs.callback = devices_destroy_cb;
-    dis->drs.force = 1;
+    dis->drs.force.flag = LIBXL__FORCE_ON;
     libxl__devices_destroy(egc, &dis->drs);
 }
 
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index e16ae9630b..1fcf85c3e2 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -2730,12 +2730,20 @@ _hidden void libxl__prepare_ao_device(libxl__ao *ao, libxl__ao_device *aodev);
 /* generic callback for devices that only need to set ao_complete */
 _hidden void device_addrm_aocomplete(libxl__egc *egc, libxl__ao_device *aodev);
 
+typedef struct {
+    enum {
+        LIBXL__FORCE_AUTO, /* Re-execute with FORCE_ON if op times out */
+        LIBXL__FORCE_ON,
+        LIBXL__FORCE_OFF,
+    } flag;
+} libxl__force;
+
 struct libxl__ao_device {
     /* filled in by user */
     libxl__ao *ao;
     libxl__device_action action;
     libxl__device *dev;
-    int force;
+    libxl__force force;
     libxl__device_callback *callback;
     /* return value, zeroed by user on entry, is valid on callback */
     int rc;
@@ -3787,7 +3795,7 @@ _hidden void libxl__bootloader_run(libxl__egc*, libxl__bootloader_state *st);
         aodev->action = LIBXL__DEVICE_ACTION_REMOVE;                    \
         aodev->dev = device;                                            \
         aodev->callback = device_addrm_aocomplete;                      \
-        aodev->force = f;                                               \
+        aodev->force.flag = f;                                          \
         libxl__initiate_device_##remtype##_remove(egc, aodev);          \
                                                                         \
     out:                                                                \
@@ -3862,12 +3870,20 @@ _hidden void libxl__bootloader_run(libxl__egc*, libxl__bootloader_state *st);
 
 
 #define LIBXL_DEFINE_DEVICE_REMOVE(type)                                \
-    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, generic, remove, 0)            \
-    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, generic, destroy, 1)
+    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, generic, remove,               \
+                                   LIBXL__FORCE_AUTO)                   \
+    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, generic, destroy,              \
+                                   LIBXL__FORCE_ON)
 
 #define LIBXL_DEFINE_DEVICE_REMOVE_CUSTOM(type)                         \
-    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, type, remove, 0)               \
-    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, type, destroy, 1)
+    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, type, remove,                  \
+                                   LIBXL__FORCE_AUTO)                   \
+    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, type, destroy,                 \
+                                   LIBXL__FORCE_ON)
+
+#define LIBXL_DEFINE_DEVICE_SAFE_REMOVE(type)                           \
+    LIBXL_DEFINE_DEVICE_REMOVE_EXT(type, generic, safe_remove,          \
+                                   LIBXL__FORCE_OFF)
 
 #define LIBXL_DEFINE_DEVICE_LIST(type)                                  \
     libxl_device_##type *libxl_device_##type##_list(libxl_ctx *ctx,     \
@@ -4028,7 +4044,7 @@ struct libxl__devices_remove_state {
     libxl__ao *ao;
     uint32_t domid;
     libxl__devices_remove_callback *callback;
-    int force; /* libxl_device_TYPE_destroy rather than _remove */
+    libxl__force force; /* libxl_device_TYPE_destroy rather than _remove */
     /* private */
     libxl__multidev multidev;
     int num_devices;
-- 
2.20.1


