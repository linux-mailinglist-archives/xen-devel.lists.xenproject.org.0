Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAD42C124D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 18:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34932.66286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFtr-0006VN-1P; Mon, 23 Nov 2020 17:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34932.66286; Mon, 23 Nov 2020 17:45:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFtq-0006Se-98; Mon, 23 Nov 2020 17:45:14 +0000
Received: by outflank-mailman (input) for mailman id 34932;
 Mon, 23 Nov 2020 17:45:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khFtl-0006J6-2z
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtk-0006Yx-JX; Mon, 23 Nov 2020 17:45:08 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khFtk-0000at-H2; Mon, 23 Nov 2020 17:45:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtl-0006J6-2z
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=ydZtYAWQIkmj6i2skveH66kfmosN7aYsaYp/dzWVx0Q=; b=QRFg5o7rk895NbrgBzIoFiA9s
	7U5fputeiBGyEiKB3H8jFHAoUcbjGNK5yMkqLWQo2V2X6XE5fy/vzvYDzZOhERnUWI/Tl234zpAK+
	9WTaFxxi2e0bq8NgkQnAVqWVXUFOxZ30C+lsUWnZBsaD0zJIIJWRFcuT9KnvmrCzL6aQk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0006Yx-JX; Mon, 23 Nov 2020 17:45:08 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khFtk-0000at-H2; Mon, 23 Nov 2020 17:45:08 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 09/23] libxl: remove unnecessary check from libxl__device_pci_add()
Date: Mon, 23 Nov 2020 17:44:49 +0000
Message-Id: <20201123174503.6800-10-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201123174503.6800-1-paul@xen.org>
References: <20201123174503.6800-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

The code currently checks explicitly whether the device is already assigned,
but this is actually unnecessary as assigned devices do not form part of
the list returned by libxl_device_pci_assignable_list() and hence the
libxl_pci_assignable() test would have already failed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index a5d5d2e78b..ec101f255f 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1555,8 +1555,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
 {
     STATE_AO_GC(aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    libxl_device_pci *assigned;
-    int num_assigned, rc;
+    int rc;
     int stubdomid = 0;
     pci_add_state *pas;
 
@@ -1595,19 +1594,6 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         goto out;
     }
 
-    rc = get_all_assigned_devices(gc, &assigned, &num_assigned);
-    if ( rc ) {
-        LOGD(ERROR, domid,
-             "cannot determine if device is assigned, refusing to continue");
-        goto out;
-    }
-    if ( is_pci_in_array(assigned, num_assigned, pci->domain,
-                         pci->bus, pci->dev, pci->func) ) {
-        LOGD(ERROR, domid, "PCI device already attached to a domain");
-        rc = ERROR_FAIL;
-        goto out;
-    }
-
     libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
-- 
2.11.0


