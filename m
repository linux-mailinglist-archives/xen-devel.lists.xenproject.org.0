Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D92002C5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 09:33:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmBWc-0000kX-Sa; Fri, 19 Jun 2020 07:33:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxsm=AA=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jmBWb-0000kR-Gw
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 07:33:21 +0000
X-Inumbo-ID: 25b6fb4e-b1ff-11ea-bb3e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25b6fb4e-b1ff-11ea-bb3e-12813bfff9fa;
 Fri, 19 Jun 2020 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=728HHyIo6p5jd0t/nnpHhhDp0disceXIBDG94ds5xwo=; b=itPeCfYxp2CmDQGWUHYz4B4gRO
 vXX/lAWg1/copLPrIUvzINDNdAtppL9Q16fcrxQ3mRi05sJ6MTqg8YavIjY8XE2Wemfhi1nqQyEJa
 P7mYvsMnGmqNdveIr2KIn2CS2ZZWttQea+/E0f0MpQb8IRHsPEu+3a5lLplkv7UvhZH0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jmBWY-0000XM-RK; Fri, 19 Jun 2020 07:33:18 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jmBWY-0001QB-He; Fri, 19 Jun 2020 07:33:18 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for 4.14] libxl: allow passthrough to PV guests regardless of
 whether IOMMU is enabled
Date: Fri, 19 Jun 2020 08:33:15 +0100
Message-Id: <20200619073315.8414-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Commit babde47a "introduce a 'passthrough' configuration option to xl.cfg..."
added a check to xl_parse.c:parse_config_data() to make sure that an IOMMU
was present and enabled in the system before allowing devices to be passed
through to a guest. This check was then subsequently moved into
libxl_create.c:libxl__domain_config_setdefault() by commit ad011ad0 "libxl/xl:
Overhaul passthrough setting logic".

Prior to this check being added, it was possible (although not in any way safe
or supported) to pass devices through to a PV guest without an IOMMU being
enabled in the system. This patch relaxes the check for PV guests to restore
that possibility, emitting a warning instead.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>A
Cc: Anthony PERARD <anthony.perard@citrix.com>

This patch ought to be in 4.14 as it as very obvious change, restoring lost
functionality that has affected a user.
---
 tools/libxl/libxl_create.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 2814818e34..f1d17cfb87 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1104,10 +1104,14 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
 
     bool iommu_enabled = physinfo.cap_hvm_directio;
     if (c_info->passthrough != LIBXL_PASSTHROUGH_DISABLED && !iommu_enabled) {
-        LOGD(ERROR, domid,
-             "passthrough not supported on this platform\n");
-        ret = ERROR_INVAL;
-        goto error_out;
+        if (c_info->type != LIBXL_DOMAIN_TYPE_PV) {
+            LOGD(ERROR, domid,
+                 "passthrough not supported on this platform\n");
+            ret = ERROR_INVAL;
+            goto error_out;
+        }
+        LOGD(WARN, domid,
+             "passthrough is enabled but IOMMU is not present/enabled\n");
     }
 
     if (c_info->passthrough == LIBXL_PASSTHROUGH_DISABLED && need_pt) {
-- 
2.20.1


