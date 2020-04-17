Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFD61ADB09
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 12:27:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPODR-0003hM-QU; Fri, 17 Apr 2020 10:27:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u48u=6B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jPODQ-0003hH-7x
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 10:27:20 +0000
X-Inumbo-ID: 03fddcb0-8096-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03fddcb0-8096-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587119240;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sVPQ2SfLGHhnQ75gorUBD/BFheC45NpGFyA7/hVH80g=;
 b=QUD4sVjrKrmGw/a/8j8DcI51JlKHjQPhjFfx9/2bFb7m3Vh1gM/ZoKiN
 mymtcQgyKEi8+PUD80IJ+oO4V/0lszxI4mUZW376Fubb7kCjelzWRlCB0
 Tbq3amPUH61ypM2Kr2ndbhGJsjDyypwTqIX1wZBrV0Tyv/1g+2N7ST3DM M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cePuOYDmdm5/Pgnbv1jlPgu1sHgz9zd4iFc7HIXBmqej2663EsG6NJFNcqsLtDA1ygN9qIOKSE
 p6E19Y9mN7o5NGoiO6W2Z67TmdVyQxThmlWgmjvb4HzNkqGoLOwrRHk2QPBOCSgmoOWVaXd9Pl
 Uc+u31tvspFa4qPzvOdcayCkDi9uGoDNGUx70y4bAaJHKe9QPjChtiIYdAdpxRsNWyFKK3l3Up
 TNOdgsHDWRKrFFW6gNwEIlZ3oVLdUO+URLzIM5i+N981zwElqdMfwABeDz7MGzp5mVbkTeXG/K
 HHA=
X-SBRS: 2.7
X-MesageID: 15848747
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,394,1580792400"; d="scan'208";a="15848747"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/vtd: fix EPT page table sharing check
Date: Fri, 17 Apr 2020 12:26:50 +0200
Message-ID: <20200417102650.20083-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Tian <kevin.tian@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The EPT page tables can be shared with the IOMMU as long as the page
sizes supported by EPT are also supported by the IOMMU.

Current code checks that both the IOMMU and EPT support the same page
sizes, but this is not strictly required, the IOMMU supporting more
page sizes than EPT is fine and shouldn't block page sharing.

This is likely not a common case (IOMMU supporting more page sizes
than EPT), but should still be fixed for correctness.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 07d40b37fe..63298d3a99 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1914,8 +1914,10 @@ static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
     if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
         return 0;
 
-    return (ept_has_2mb(ept_cap) && opt_hap_2mb) == cap_sps_2mb(vtd_cap) &&
-           (ept_has_1gb(ept_cap) && opt_hap_1gb) == cap_sps_1gb(vtd_cap);
+    return ((ept_has_2mb(ept_cap) && opt_hap_2mb) ? cap_sps_2mb(vtd_cap)
+                                                  : true) &&
+           ((ept_has_1gb(ept_cap) && opt_hap_1gb) ? cap_sps_1gb(vtd_cap)
+                                                  : true);
 }
 
 /*
-- 
2.26.0


