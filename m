Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390311A900E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSa-0001Sx-N5; Wed, 15 Apr 2020 01:03:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSZ-0001Rz-Gx
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:23 +0000
X-Inumbo-ID: db025530-7eb4-11ea-b58d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db025530-7eb4-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 01:03:02 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAF3D20787;
 Wed, 15 Apr 2020 01:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912582;
 bh=xC9W/4oLDuoIZtmDlnuiRW23B9RMI1gQZH5SwKKFaVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0dp9DHp2jHw/sPPiaFpgucYy8LGFeesqq+1J5QFa+9mJbTH3HX1/zXFi1nFXnH1mv
 dD96TMTIU9TE94LmUXVRhDyWrAIUvn8CN8lr6Hn5ZKA2mZv6DgiWEhbQZp2q9qP7DY
 nqQ7EwTkgPUDPqFyGceQyYup5IjABiKr/SFJSF4Y=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 12/12] xen/arm: call iomem_permit_access for passthrough
 devices
Date: Tue, 14 Apr 2020 18:02:55 -0700
Message-Id: <20200415010255.10081-12-sstabellini@kernel.org>
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

iomem_permit_access should be called for MMIO regions of devices
assigned to a domain. Currently it is not called for MMIO regions of
passthrough devices of Dom0less guests. This patch fixes it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d0fc497d07..d3d42eef5d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1846,6 +1846,17 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
             return -EINVAL;
         }
 
+        res = iomem_permit_access(kinfo->d, paddr_to_pfn(mstart),
+                                  paddr_to_pfn(PAGE_ALIGN(mstart + size - 1)));
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to permit to dom%d access to"
+                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                   kinfo->d->domain_id,
+                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
+            return res;
+        }
+
         res = map_regions_p2mt(kinfo->d,
                                gaddr_to_gfn(gstart),
                                PFN_DOWN(size),
-- 
2.17.1


