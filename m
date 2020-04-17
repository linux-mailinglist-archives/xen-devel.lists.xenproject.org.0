Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2E1AE80F
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2020 00:17:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPZHR-0006fb-U0; Fri, 17 Apr 2020 22:16:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JcYo=6B=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jPZHQ-0006fW-E3
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 22:16:12 +0000
X-Inumbo-ID: 0b924700-80f9-11ea-b58d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b924700-80f9-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 22:16:12 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F32220656;
 Fri, 17 Apr 2020 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587161771;
 bh=gb3Z9a2VrqqwohrS52ctiZQwXXCEVwx1D9sYthQAaBA=;
 h=From:To:Cc:Subject:Date:From;
 b=rCo8cU3hxVvD+j2afiY73LvWzbGWr81CAXYZXvJloPVc2WLXNBApK7OE1L8avdFAu
 DM8KWKwmgCfsD2KZ3vYgRsfIt/CrbWkqXsG45TJeqZEOnVFGmiMHcLDVdX6VQRY3xc
 s6OMUUMjpT/MvOXkqSuevESQd9B7FDK1UYj2wDVQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Subject: [PATCH][RESEND] xen/arm: vgic-v3: fix GICD_ISACTIVER range
Date: Fri, 17 Apr 2020 15:16:09 -0700
Message-Id: <20200417221609.19928-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: xen-devel@lists.xenproject.org, Peng Fan <peng.fan@nxp.com>,
 sstabellini@kernel.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Peng Fan <peng.fan@nxp.com>

The end should be GICD_ISACTIVERN not GICD_ISACTIVER.

(See https://marc.info/?l=xen-devel&m=158527653730795 for a discussion on
what it would take to implement GICD_ISACTIVER/GICD_ICACTIVER properly.)

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4e60ba15cc..fd8cfc156d 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -713,7 +713,7 @@ static int __vgic_v3_distr_common_mmio_read(const char *name, struct vcpu *v,
         goto read_as_zero;
 
     /* Read the active status of an IRQ via GICD/GICR is not supported */
-    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVER):
+    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
         goto read_as_zero;
 
-- 
2.17.1


