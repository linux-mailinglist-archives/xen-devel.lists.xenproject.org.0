Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D8129737C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11161.29600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzqk-00088W-93; Fri, 23 Oct 2020 16:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11161.29600; Fri, 23 Oct 2020 16:23:30 +0000
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
	id 1kVzqk-00087y-4j; Fri, 23 Oct 2020 16:23:30 +0000
Received: by outflank-mailman (input) for mailman id 11161;
 Fri, 23 Oct 2020 16:23:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzqi-00081j-Rz
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79d71e5c-7d8c-4c80-abe7-635d4a86d4f5;
 Fri, 23 Oct 2020 16:23:23 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqc-0008J8-Po; Fri, 23 Oct 2020 16:23:22 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqc-000376-HB; Fri, 23 Oct 2020 16:23:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzqi-00081j-Rz
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:28 +0000
X-Inumbo-ID: 79d71e5c-7d8c-4c80-abe7-635d4a86d4f5
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 79d71e5c-7d8c-4c80-abe7-635d4a86d4f5;
	Fri, 23 Oct 2020 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=jx3PjnZjVUkMl0nTJ/ptt3J2EPZY9Ep+JNq2r5DzMzg=; b=3S9cR+SJl4FReoaGiBqUu4J0t
	pVMo50e3/3gUicBPd4w81CCLEVHsqVSIJauT2TLpg9nDfm/otfSMWU9oYPsVbd50aKyobs1fNHMnE
	g3O+YXXLXQGpysTGjgRPuYFO35oLbcxXnt+ouxc6LwBub93TlsMI5BK+MerK0WG/Mbhvs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqc-0008J8-Po; Fri, 23 Oct 2020 16:23:22 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqc-000376-HB; Fri, 23 Oct 2020 16:23:22 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 03/25] libxl: use LIBXL_DEFINE_DEVICE_LIST for nic devices
Date: Fri, 23 Oct 2020 16:22:52 +0000
Message-Id: <20201023162314.2235-4-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

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
index 0e5d120ae9..a44058f929 100644
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
2.11.0


