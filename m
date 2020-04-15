Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A31A9010
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSd-0001Vj-3i; Wed, 15 Apr 2020 01:03:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSb-0001Ty-51
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:25 +0000
X-Inumbo-ID: da691cc7-7eb4-11ea-89ec-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da691cc7-7eb4-11ea-89ec-12813bfff9fa;
 Wed, 15 Apr 2020 01:03:02 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 710A020936;
 Wed, 15 Apr 2020 01:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912581;
 bh=M3mtuPpEn22GeE50cx6N0881izwzd4quzv104vMzFfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y4Bds0ycsmoxzcYjuu7OsHu5scVsagsNNWhTxdJxA3UzS4VXkzQVX1gtf16K+pT0C
 EujAoCXu6f9tdHNkM1m3eLInwHaT1nfmtJzch8OE57qrxMvXxuk6AxUuFyDVwaIA6v
 dzCI8ezkbrBcBrKW4e2RlvikiZL7jpamaOvpcidQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 11/12] xen/arm: if xen_force don't try to setup the IOMMU
Date: Tue, 14 Apr 2020 18:02:54 -0700
Message-Id: <20200415010255.10081-11-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr_Babchuk@epam.com, sstabellini@kernel.org, julien@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If xen_force (which means xen,force-assign-without-iommu was requested)
don't try to add the device to the IOMMU. Return early instead.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9bc0b810a7..d0fc497d07 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1884,12 +1884,14 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     if ( res < 0 )
         return res;
 
+    if ( xen_force )
+        return 0;
+
     res = iommu_add_dt_device(node);
     if ( res < 0 )
         return res;
 
-    /* If xen_force, we allow assignment of devices without IOMMU protection. */
-    if ( xen_force && !dt_device_is_protected(node) )
+    if ( !dt_device_is_protected(node) )
         return 0;
 
     return iommu_assign_dt_device(kinfo->d, node);
-- 
2.17.1


