Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32194808544
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649753.1014597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBP4-0003lY-Jz; Thu, 07 Dec 2023 10:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649753.1014597; Thu, 07 Dec 2023 10:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBP4-0003jf-HC; Thu, 07 Dec 2023 10:14:46 +0000
Received: by outflank-mailman (input) for mailman id 649753;
 Thu, 07 Dec 2023 10:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3y0a=HS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rBBP3-0003jZ-Pv
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:14:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a2781e-94e9-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 11:14:44 +0100 (CET)
Received: from MN2PR17CA0006.namprd17.prod.outlook.com (2603:10b6:208:15e::19)
 by IA1PR12MB6212.namprd12.prod.outlook.com (2603:10b6:208:3e4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 10:14:40 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:15e:cafe::e3) by MN2PR17CA0006.outlook.office365.com
 (2603:10b6:208:15e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 10:14:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 10:14:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 04:14:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 7 Dec
 2023 04:14:39 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 7 Dec 2023 04:14:38 -0600
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
X-Inumbo-ID: 70a2781e-94e9-11ee-98e7-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6rASXLSUg7L400/jcb/QIseqtMmXPd8CODRMPRud97oY33VeXDoc/wirb5J/cVCOp0VpceJaL7rMo7LGQ4Rtk7VXx0KFtJcxsPcYIE/0UJqSBsAkh2gbydbjN9+AA16jJMOl8KexFFV0gDTKsT2G6g9P3Og0fqqG3rkrZ48DLWL36TaaL8hgtuMVEqduL8ngqJMY/1tXfcg5YVCEd2hxKDhjXXMzQ9dYXtQ6cGwOP8QLvDaYNLQK9pmbqkCr5vueYmuSKWXSWwT+YpHd15xykzcF+jPFMttviwMzpNW4t7rBSEiSKNs44PGjL2rqzHH72vItEGLYSaR3xgjP7vhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOVdor1/yV1fzI4Tcri4bpJHQ8CioN6n2kubyVLWEik=;
 b=nFJBAJiTodQ50ptNVsafy9aYnO54zcxPd2AclY78lxsycntoPp76o3j5vKegmS5lUVqMuVUgoZIb3krE0MFsQEU7dxiC/5ROM8dsAGBDm6vd6YUAAX1x/XloQdsAVkAaIRxdUvOfb4xt3Kfk+CiyHkHPahUyfZbwbDjvnTZmeg1mhRsWzXf1vQfRLfr59VnktT+mtAWw2RLzEH2xh0a2/E0NjOMs6+3Bo8/VWLuVy73bFBfj3fEYRRgshvzdDqYRwkRfQrUHv7OIIcwayxV1fJ4FcFpmmh2bRsWwBmEubjaxFCOLAJqWTBZfdU89/m01HDnVTkHRFdhzz6xT0/S5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOVdor1/yV1fzI4Tcri4bpJHQ8CioN6n2kubyVLWEik=;
 b=tlXNoZ4wxuYWzQWX+u9740yPDeuNFrTr1WHpjOH6ejUr9UDNxbqGmkd4qt5OftDSdIS5ne+Ah1cLMcS3v6JJpwxt0T/H5rAyQt2eKMOeepRu9yXuXIHg2QrhhH0Z8jF5sG+9XzgfU1+PwqAdZrHpXZVXrsSm1x9kKcowcHvkfnQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: bootfdt: Check return code of device_tree_for_each_node()
Date: Thu, 7 Dec 2023 11:14:32 +0100
Message-ID: <20231207101432.37732-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|IA1PR12MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 40107dc5-9c37-488e-e1dd-08dbf70d52f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	glKQT8/u0rUJ+ySYCxzroQ0UExOjhcATMWmMK/Hd9gbDY+7gvTVglUAew1GEolsJyE7b5wm9C3Jj2Yqsb20TrwzDX5ai9T9mU/yjAmNz37O9ByjjZcxZBC7T+DL+onnZt7E9VP/MZDFyYPXVzCMFzql8DbHhT3CROiXnASpPPLN7mfG1bOQpBcFZIBqagT1j5WiE+eO+TnhHYkj33jvbC1CtNCAEej/sRUE4sh19mjhvXPVw4N7Djzw2r1h+cjDrIX8B9YYndUinO8wRmnUmOXBXmrjjgaVnlaHJ+OjS9IQXsY6xbXltRM2H/4bBgfV601yhwap1tziYvwXGxVv0nZ3EToG7JdR9js2jN8tOiJhPaTIPiur4kIvUtdnz1fGPcldGQGpjhTUzlHMuuE38SXukgaCsz2V5WUlBYeJyoQ+cU6ke3prvSBpJP0fe2mt57hG3tghv2/GtwuVGDpjhFFUZ0AsOT3o1dDfVxu9fs+/HYljvGdc7OOvXhNqoP2XuLg+viirQlQ5pa7riZC94zEAU2ETeR4P34y2wla6/8sI28IDQsgmoG/jOUZnidD/KOZMnELOXxi3To88IAD3W2q/SUVx6THO08MN5WJd8C5/tnAsbmy7eBs505CPd8nCTbGixc4j3MbRpUluHLV44HfajYKdVkf87KPMm9CuFeIdCM8yC/a2ABGp/4WcD7eFPLXPuv0pf8e03NXUmorTOxOGa4lmenoKBNUlJ4pwvc78eHj1vCPGKjoTXqaVpVIfWVBS4aIgY7SoGgrcVrUgvAQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(81166007)(47076005)(356005)(40480700001)(336012)(83380400001)(426003)(36860700001)(1076003)(2616005)(41300700001)(6666004)(26005)(6916009)(54906003)(316002)(478600001)(70586007)(70206006)(82740400003)(86362001)(44832011)(40460700003)(5660300002)(2906002)(4326008)(8936002)(8676002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 10:14:40.1331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40107dc5-9c37-488e-e1dd-08dbf70d52f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6212

As a result of not checking the return code of device_tree_for_each_node()
in boot_fdt_info(), any error occured during early FDT parsing does not
stop Xen from booting. This can result in an unwanted behavior in later
boot stages. Fix it by checking the return code and panicing on an error.

Fixes: 9cf4a9a46717 ("device tree: add device_tree_for_each_node()")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
I've lost count how many times I had to fix missing rc check. However, I have
not yet found any checker for this (-Wunused-result is pretty useless).
---
 xen/arch/arm/bootfdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index b1f03eb2fcdd..f496a8cf9494 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -541,7 +541,9 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
 
     add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
 
-    device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
+    ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
+    if ( ret )
+        panic("Early FDT parsing failed (%d)\n", ret);
 
     /*
      * On Arm64 setup_directmap_mappings() expects to be called with the lowest
-- 
2.25.1


