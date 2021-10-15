Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8096842E71B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 05:11:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209667.366206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDbz-0003Kv-Dn; Fri, 15 Oct 2021 03:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209667.366206; Fri, 15 Oct 2021 03:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbDbz-0003IE-AX; Fri, 15 Oct 2021 03:10:23 +0000
Received: by outflank-mailman (input) for mailman id 209667;
 Fri, 15 Oct 2021 03:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHOs=PD=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mbDby-00031m-HR
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 03:10:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::621])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b63b6b2c-76f8-4417-a6f8-a227120815dc;
 Fri, 15 Oct 2021 03:10:18 +0000 (UTC)
Received: from DB6PR0601CA0043.eurprd06.prod.outlook.com (2603:10a6:4:17::29)
 by DB6PR0801MB1765.eurprd08.prod.outlook.com (2603:10a6:4:38::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 03:10:16 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::8d) by DB6PR0601CA0043.outlook.office365.com
 (2603:10a6:4:17::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:16 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Fri, 15 Oct 2021 03:10:16 +0000
Received: from abdff308bcca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4655ED72-7ECA-4A4D-B635-EDAD75685562.1; 
 Fri, 15 Oct 2021 03:10:08 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abdff308bcca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 03:10:08 +0000
Received: from AM6P193CA0114.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::19)
 by HE1PR0802MB2508.eurprd08.prod.outlook.com (2603:10a6:3:da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 15 Oct
 2021 03:10:06 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::9e) by AM6P193CA0114.outlook.office365.com
 (2603:10a6:209:85::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 03:10:06 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Fri, 15 Oct
 2021 03:10:13 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 15
 Oct 2021 03:10:02 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:10:10 +0000
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
X-Inumbo-ID: b63b6b2c-76f8-4417-a6f8-a227120815dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxQzaj8bxDJrQZPGe9E3dFpGC2GbrG4KgFstgpHsfm8=;
 b=3GbRs4RNhe3nKnZi7wFAY4qlFTF8G9Tr0qgDqoS+E3q3PYufQsSlNVjhCHXpe8mb0JY3LWpCBSenXt/sT6NaasvXFyCSgjMmqA954boPTcpJ+H+DkI+IL9iVhMtTtf8RwKr6OPJQMZxmPJtlHYP/FlANtL9zF5yJ0oOZEqEsa6M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: afbeba64a31eb55c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwPUvxzo4rmFYgBHlmdHhqsqAuUpCIFNZRDMBOq7Fm3h0XbBurTJhhClN9uFrfj+rQJO3USDaCIEZsKKW2i1EOdAjOzkj76hP3emRqBvDmKRIc7/kZjR+TxckUNrdGEIzp68PbwJjT9vx1bfip0MTyyh0txLyQsM5Xr5v0NhBCePLctOTMXzO3TaX56dTLpOKxe/1gCis2qRmPBW8zrs5UdpoiZF15iDHaUom8axKW8xrJuXUadmOMniHRaTwDABHMBiJLT7TTfYn6DzFDHtKL1LjZCy1IcGwi0lMO84VTsC2IbFNP9DhxAv2gpw9Ly2Y1mND+ieFUckF4dxk+Jz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxQzaj8bxDJrQZPGe9E3dFpGC2GbrG4KgFstgpHsfm8=;
 b=SuAtWNzbyGWEBvWr6AA2iRNvu3M1uv3zN/pjlKCPcXFJC6D/cOJO+LUmhy5HBm4pW8sCV8yIuQFn1fu/O4PN48wpZ6v/SgqkisyN+XF/95/5k+QqH9TKNCX8glU8nSZFnE4+NiXz7ME9KztU4AANsif/B37f1UIboKeSsPkR0bxL2rFOvxj+pm+AHi00frAMzRYK0K0zvAfQ9S39BBRpFkTc/N8Z31zvKONevaWLktDGYLcfRfrxMYcz9a2iIAlbGcBblu5BxSsWFOmiYhsqYy90Yb+evGvHo9TGvxRwsQZab+Q5I9XerLNZpMW9ulk5fsICdfkXJgEbval/wVCgFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxQzaj8bxDJrQZPGe9E3dFpGC2GbrG4KgFstgpHsfm8=;
 b=3GbRs4RNhe3nKnZi7wFAY4qlFTF8G9Tr0qgDqoS+E3q3PYufQsSlNVjhCHXpe8mb0JY3LWpCBSenXt/sT6NaasvXFyCSgjMmqA954boPTcpJ+H+DkI+IL9iVhMtTtf8RwKr6OPJQMZxmPJtlHYP/FlANtL9zF5yJ0oOZEqEsa6M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Wei.Chen@arm.com>, <Bertrand.Marquis@arm.com>
Subject: [PATCH v2 1/6] xen: introduce XEN_DOMCTL_CDF_directmap
Date: Fri, 15 Oct 2021 03:09:40 +0000
Message-ID: <20211015030945.2082898-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015030945.2082898-1-penny.zheng@arm.com>
References: <20211015030945.2082898-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d86e9e0-ace6-43ae-bcbb-08d98f894ffb
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2508:|DB6PR0801MB1765:
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1765D66EC0DBF355BD205423F7B99@DB6PR0801MB1765.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U1ty+ibemTCbIeGMwF4OAHVZDsAsc2PYbhSfnRSCutv4EBvjdP0WQpaLtns1eAwkSbnvy9acf5/afkzc25Jc7/Ra4XOZ4F+vruchFuq7o8qMuPMQsmEJBdiIzFU8yhzKCh0vU7Rm+mSknpVdGfOsPNfK3y/TBgKbjWm3QU25PSMIMmIyjJ3G25dcaefVtmHX2ovy+ykkVCJRCKXa6lQVo8elLcuMjiZRAFa2JwxMY7Hcydukco4nvbbxk2gbEzSc9YoBjf/iq2xLRb8k08IfB/3l0UYHB3Lj8X3gBCCTwz9joBSlESUKBrxccDXpWqKO9ihcBAVd5VaGQV2UUKrudmSeMEf1POPg2SJBpTrmTEd41zW6W6r+YSRbc+oPT3coVR0FrKavWLwPbUrQvLMbB9toAM5RZsgEqREQPzWpgd0kGZViuhnQeikV6p7lnP3k5O/4zN58OrmFmOqzMcopRNGXWtpreOjFTTOWj1OQIhAj08p+bhhmCB8j0pCqsWeyFE1WTjzQosTH3RPG6jaVKx9g0/4ovH4gWapdF+PLMJPgUsTduU2OkqKDL8eSwf7NVMea1qPRgw1ub2Wgj2x8GVi8HwEnfpoRXcv0QlNHsJbPU+tAWUfAPkqtTckm6XGT3a5ZNBAjZV6y5TnlWYWF1C5CTLeDkwZxSgR/5R5N9YivJbaCxtWOmJbgmlp63BMHKRNH37YAOc57ORooREyNKtv+CrhAzOBJZ4NfNAD4Xwo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(26005)(2616005)(426003)(110136005)(47076005)(36756003)(44832011)(70586007)(83380400001)(86362001)(6666004)(4326008)(8676002)(7696005)(336012)(2906002)(186003)(1076003)(356005)(81166007)(54906003)(8936002)(5660300002)(70206006)(36860700001)(508600001)(82310400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2508
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba3333e1-8569-4fa4-ae78-08d98f894a09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dRjO+6ZTK7qq6ELIgj8p/EuVggXWBRKIxbCXoTlgyXpNCExEDXaQp7p4YwIXuEhmcVBb0uP8bAfsytT0i0+C86oH8u61J44yTUbyPCFKg1yUEr0Y78fdb9us1LDTd/0kuPWGSH1Y/NZCaYUjQ1M2R76wRiFlDHV1AkxmBbhv47qKtReaXoX6vrvn/K6df8J5C0xrQ4kjM43GbOEsFjYmaY/iOixcoiRjntC4TQIYToJ2BxlYjGXCZLl3qWkg/7VMGdiRrS8vaWVLK2iEfJW6jHW5uFVrpDgVBNso6EYj/mGcgcrflNsGg9At3LBHdzeW+JNi5WOteb4Yn/aD/95p7GlIU1FUu4zepnbY5SIvB8t7XLwCTO8oWGMhHVp8Dpn9j43c4Fg2QE8f0A7Hgj436cZklQB5sdNyCmmdIVXye/SBB4Ha9ALTCxYPNDq8Z9QVPFUfCFNQT8MPLRkyFDyJFklbivxeYUhBDUcsazLXCJeT1U984wvpVIBk8r9vNilATdUnH/7bTLwheCDCr/qx9lNUuzx6yKy0aua+MC3fHhc+PvRQP/kjy7wr/OpPSJeeo82n5eo+pyDS5Wtb8nSzKMDasuV0J1iYmGzbMwFgYv+vCsZaT89qeiFLbbxNHRs+La0+svOAa6ECx2sWis7/3Xu0K2IIhaXVvg2P27LxnuY2OREtZpJMYFluVmzqxdOdjvjicxBYvB6U+7TYsR+kmw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(6666004)(336012)(82310400003)(36860700001)(2616005)(426003)(70586007)(1076003)(70206006)(44832011)(110136005)(5660300002)(7696005)(47076005)(54906003)(8936002)(86362001)(36756003)(316002)(508600001)(83380400001)(186003)(8676002)(4326008)(26005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:10:16.4755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d86e9e0-ace6-43ae-bcbb-08d98f894ffb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1765

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

This commit introduces a new arm-specific flag XEN_DOMCTL_CDF_directmap to
specify that this domain should have its memory directly mapped
(guest physical address == physical address) at domain creation.

Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_directmap is set.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/arm/domain.c        | 3 ++-
 xen/arch/arm/domain_build.c  | 4 +++-
 xen/common/domain.c          | 3 ++-
 xen/include/asm-arm/domain.h | 4 ++--
 xen/include/public/domctl.h  | 4 +++-
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index eef0661beb..8cee1c6349 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -628,7 +628,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
-    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
+    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
+                                   XEN_DOMCTL_CDF_directmap);
 
     if ( (config->flags & ~flags_optional) != flags_required )
     {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0167731ab0..37e2d62d47 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3069,8 +3069,10 @@ static int __init construct_dom0(struct domain *d)
 void __init create_dom0(void)
 {
     struct domain *dom0;
+    /* DOM0 has always its memory directly mapped. */
     struct xen_domctl_createdomain dom0_cfg = {
-        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
+                 XEN_DOMCTL_CDF_directmap,
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8b53c49d1e..7a6131db74 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -486,7 +486,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
+           XEN_DOMCTL_CDF_directmap) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 14e575288f..fc42c6a310 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -29,8 +29,8 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-/* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) is_hardware_domain(d)
+/* Check if domain is direct-map memory map. */
+#define is_domain_direct_mapped(d) (d->options & XEN_DOMCTL_CDF_directmap)
 
 struct vtimer {
     struct vcpu *v;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 238384b5ae..b505a0db51 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -72,9 +72,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
+/* If this domain has its memory directly mapped? (ARM only) */
+#define XEN_DOMCTL_CDF_directmap      (1U << 8)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_directmap
 
     uint32_t flags;
 
-- 
2.25.1


