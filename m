Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9B25BECA
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 12:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDm7n-0000yH-Aj; Thu, 03 Sep 2020 10:05:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rObT=CM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kDm7l-0000xt-Cm
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 10:05:45 +0000
X-Inumbo-ID: 60b0fc1e-eacb-467d-b6a8-20b92b3dc9c3
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60b0fc1e-eacb-467d-b6a8-20b92b3dc9c3;
 Thu, 03 Sep 2020 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=DPBUlM35jhYlf960TGWbjpD76dUBghbgq1ala0F7pCc=; b=IncWCt6ubITXyNjv8DHCyDfKkO
 g1W68Sk12Cro7FDApSiiXjkSw63RYultcM1dLis3fPtG/Fdh8PDktWoIo6L4zPmN9JSZq4RvFXQQM
 piHw1KFlQ0BQkDAULS8neNFxVrxvrwBx5iD2SPRvRmFr9ypnUuQldLl3ZlQeCcVySU9k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kDm7h-0005b0-1b; Thu, 03 Sep 2020 10:05:41 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kDm7g-0007WE-P7; Thu, 03 Sep 2020 10:05:40 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] libxl: do not automatically force detach of block devices
Date: Thu,  3 Sep 2020 11:05:37 +0100
Message-Id: <20200903100537.1337-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903100537.1337-1-paul@xen.org>
References: <20200903100537.1337-1-paul@xen.org>
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

The manpage for 'xl' documents that guest co-operation is required for a (non-
forced) block-detach operation and that it may consequently fail. Currently,
however, the implementation of generic device removal means that a time-out
of a block-detach is being automatically re-tried with the force flag set
rather than failing. This patch stops such behaviour.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libxl/libxl_device.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/libxl/libxl_device.c b/tools/libxl/libxl_device.c
index 0381c5d509..d17ca78848 100644
--- a/tools/libxl/libxl_device.c
+++ b/tools/libxl/libxl_device.c
@@ -1092,7 +1092,8 @@ static void device_backend_callback(libxl__egc *egc, libxl__ev_devstate *ds,
 
     if (rc == ERROR_TIMEDOUT &&
         aodev->action == LIBXL__DEVICE_ACTION_REMOVE &&
-        !aodev->force) {
+        !aodev->force &&
+        aodev->dev->kind != LIBXL__DEVICE_KIND_VBD) {
         LOGD(DEBUG, aodev->dev->domid, "Timeout reached, initiating forced remove");
         aodev->force = 1;
         libxl__initiate_device_generic_remove(egc, aodev);
@@ -1103,7 +1104,8 @@ static void device_backend_callback(libxl__egc *egc, libxl__ev_devstate *ds,
         LOGD(ERROR, aodev->dev->domid, "unable to %s device with path %s",
                     libxl__device_action_to_string(aodev->action),
                     libxl__device_backend_path(gc, aodev->dev));
-        goto out;
+        if (!aodev->force)
+            goto out;
     }
 
     device_hotplug(egc, aodev);
@@ -1319,7 +1321,8 @@ static void device_hotplug_done(libxl__egc *egc, libxl__ao_device *aodev)
     device_hotplug_clean(gc, aodev);
 
     /* Clean xenstore if it's a disconnection */
-    if (aodev->action == LIBXL__DEVICE_ACTION_REMOVE) {
+    if (aodev->action == LIBXL__DEVICE_ACTION_REMOVE &&
+        (aodev->force || !aodev->rc)) {
         rc = libxl__device_destroy(gc, aodev->dev);
         if (!aodev->rc)
             aodev->rc = rc;
-- 
2.20.1


