Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF091ADC2E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 13:30:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPPCN-000123-JI; Fri, 17 Apr 2020 11:30:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u48u=6B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jPPCL-00011y-J2
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 11:30:17 +0000
X-Inumbo-ID: ced242de-809e-11ea-8cbb-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ced242de-809e-11ea-8cbb-12813bfff9fa;
 Fri, 17 Apr 2020 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587123016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AvVKH8/nmaAKkcfNP9IppKatqInv4zImFWpcshcgltQ=;
 b=NXJyWdMEVwWlW4Msgd3CI81CMXpUgOThN6lp6mhgAMqfG61CyJrGTAYy
 88SKs5yMACkZbzg3xDaAdyI5F+Jk3x+XyrDSsLIhRzIrnniaZCM8bHfS2
 YXTMkdDMNDn/csqRziUtedilGxp4Ln0y406Yy/gcBB3cZFv5XHSIPogsq M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PIw3IpUuYKYIREodqPJr4JplEjMBLctkfo0zVxZGL5y2d2BfbDS/EhAIS8QYLq0pIpxYqnMSwz
 SAAFDuxvgI6OpH4+OEYnD0qDQOHDqc3cUjC7++sGGCtl4gNghfqFB/vI4eM7qB18Npz5IWO8pI
 wrGhJwIVo3/W6yZMGWE/JbllCPyFy9YCcq3AT21rXXpu0xumWTL2cn1i5NFjNMPu71qkIq6/O3
 6HOQKSaPtIorXiHFdmKecKAlS8iiYpRB3FxCqKWvPJWvXM1dp1BmHJ4qpE/GniajK80zyD4rBm
 XRE=
X-SBRS: 2.7
X-MesageID: 16078695
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,394,1580792400"; d="scan'208";a="16078695"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/vtd: relax EPT page table sharing check
Date: Fri, 17 Apr 2020 13:29:54 +0200
Message-ID: <20200417112954.21250-1-roger.pau@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The EPT page tables can be shared with the IOMMU as long as the page
sizes supported by EPT are also supported by the IOMMU.

Current code checks that both the IOMMU and EPT support the same page
sizes, but this is not strictly required, the IOMMU supporting more
page sizes than EPT is fine and shouldn't block page table sharing.

This is likely not a common case (IOMMU supporting more page sizes
than EPT), but should still be fixed for correctness.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Use <= to compare caps.
 - Reword subject/commit message.
---
 xen/drivers/passthrough/vtd/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 07d40b37fe..208b33c0e4 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1914,8 +1914,8 @@ static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
     if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
         return 0;
 
-    return (ept_has_2mb(ept_cap) && opt_hap_2mb) == cap_sps_2mb(vtd_cap) &&
-           (ept_has_1gb(ept_cap) && opt_hap_1gb) == cap_sps_1gb(vtd_cap);
+    return (ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
+           (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap);
 }
 
 /*
-- 
2.26.0


