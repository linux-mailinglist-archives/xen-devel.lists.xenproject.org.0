Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC32ADD6C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 18:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23566.50393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoC-0002uu-O5; Tue, 10 Nov 2020 17:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23566.50393; Tue, 10 Nov 2020 17:51:56 +0000
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
	id 1kcXoC-0002uT-Jo; Tue, 10 Nov 2020 17:51:56 +0000
Received: by outflank-mailman (input) for mailman id 23566;
 Tue, 10 Nov 2020 17:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXoB-0002u0-2N
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:51:55 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 729d886a-8552-4cd6-8f9c-64283fde34a4;
 Tue, 10 Nov 2020 17:51:54 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXo9-0006Yn-Ar; Tue, 10 Nov 2020 17:51:53 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXo9-0007RC-3F; Tue, 10 Nov 2020 17:51:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXoB-0002u0-2N
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:51:55 +0000
X-Inumbo-ID: 729d886a-8552-4cd6-8f9c-64283fde34a4
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 729d886a-8552-4cd6-8f9c-64283fde34a4;
	Tue, 10 Nov 2020 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=cosKl6EG8MD5F2R40iXfQB/FbWXbninM7U6ZXHr119k=; b=uUVc7HdwpmMGC+VhMEfaxno2UN
	cXqhkT1NKfbsyPJfh+xmnEzdhtmt7ZowgpKR/IflV1I4wGREFvcGPtvuGXlXn7jlxzcRQpJjM+sX+
	MpeX9AE2+PtFDO1SJ2O2LiPVxol4A53cN84N4ElKyUc+i6M0UudX0rsDpjtPOI1mAuPQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXo9-0006Yn-Ar; Tue, 10 Nov 2020 17:51:53 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXo9-0007RC-3F; Tue, 10 Nov 2020 17:51:53 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 03/24] libxl: use LIBXL_DEFINE_DEVICE_LIST for nic devices
Date: Tue, 10 Nov 2020 17:51:26 +0000
Message-Id: <20201110175147.7067-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Remove open-coded definitions of libxl_device_nic_list() and
libxl_device_nic_list_free().

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>

This patch is slightly tangential. I just happend to notice the inefficiency
while looking at code for various device types.
---
 tools/libs/light/libxl_nic.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index 0e5d120ae9a4..a44058f92951 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -403,24 +403,6 @@ static int libxl__nic_from_xenstore(libxl__gc *gc, const char *libxl_path,
     return rc;
 }
 
-libxl_device_nic *libxl_device_nic_list(libxl_ctx *ctx, uint32_t domid, int *num)
-{
-    libxl_device_nic *r;
-
-    GC_INIT(ctx);
-
-    r = libxl__device_list(gc, &libxl__nic_devtype, domid, num);
-
-    GC_FREE;
-
-    return r;
-}
-
-void libxl_device_nic_list_free(libxl_device_nic* list, int num)
-{
-    libxl__device_list_free(&libxl__nic_devtype, list, num);
-}
-
 int libxl_device_nic_getinfo(libxl_ctx *ctx, uint32_t domid,
                               const libxl_device_nic *nic,
                               libxl_nicinfo *nicinfo)
@@ -527,6 +509,7 @@ LIBXL_DEFINE_DEVID_TO_DEVICE(nic)
 LIBXL_DEFINE_DEVICE_ADD(nic)
 LIBXL_DEFINE_DEVICES_ADD(nic)
 LIBXL_DEFINE_DEVICE_REMOVE(nic)
+LIBXL_DEFINE_DEVICE_LIST(nic)
 
 DEFINE_DEVICE_TYPE_STRUCT(nic, VIF,
     .update_config = libxl_device_nic_update_config,
-- 
2.20.1


