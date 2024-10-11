Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7360899ADFE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 23:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817380.1231412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szN3R-0002dV-Lj; Fri, 11 Oct 2024 21:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817380.1231412; Fri, 11 Oct 2024 21:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szN3R-0002b6-Ig; Fri, 11 Oct 2024 21:20:09 +0000
Received: by outflank-mailman (input) for mailman id 817380;
 Fri, 11 Oct 2024 21:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I9YX=RH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1szN3P-0002b0-UN
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 21:20:07 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2407::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9534c99b-8816-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 23:20:05 +0200 (CEST)
Received: from CH2PR17CA0002.namprd17.prod.outlook.com (2603:10b6:610:53::12)
 by CY8PR12MB7265.namprd12.prod.outlook.com (2603:10b6:930:57::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 11 Oct
 2024 21:20:01 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::41) by CH2PR17CA0002.outlook.office365.com
 (2603:10b6:610:53::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 21:20:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 21:20:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 16:20:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 16:20:00 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 16:19:58 -0500
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
X-Inumbo-ID: 9534c99b-8816-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=th6PUN7uPDLZw2SOnzfSZl6fph7+g1qYcNvKD9nP2vp6dpKk3OmyUuXK0dNueS0bZJmsfdAOXCg6eyTxuXTxpOb3w1OJvPICqPTc0iINJ+CQvgE3FSAHbS52ZkRSqAIJtK6MoZcpA4J5o0lTyzWpt/IRU1yaRVCb9gSpwmlpRtAA+vYXiI5nwSzODSldO5rFTyeCOue94SF0oxGm2uQpEFCH2DG6YDS686VeWmX8MvvrMnxaBw+w0oW+u4G4o0bMedJr631XHQYVfzy2LIwEWyKAP24y1Z/mhzYB5BK/nKlRmTKWdYgq9WIKXyfThxD9f6kMizuxrf00x11qiSrKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY3yq9h5CtR2y/1Tci7pEa0GcD7LcLoRuyzXb6JpApI=;
 b=VfyWyC3XALpM1nrzwos89ZWFPmzK1AVAqWtnrqlLZxTFG7rebdMmyLGcBDMc78n9+RR5s2IxrpmyIpa/0xPiFUhxsAabJ2ziSatNhdk0CVHwao/zva92Op1eCiE8Vtiry2BvaU5U2o0XljMQ4iASs1ZDTnIh64D8sy2dDKZi0JAi7NbeK1ez+90u63i1AU/eJiFiHfp83QekHY7c/zkwG+UY+zsHlsJh+9J/CWu1RVlplulLJfVoVuqGO1VdKDqVYFC+ssj9ETxbsQrsVOHhBglNLrJnBuc5kpBVecEVKtlBWOKJZCIfCDBF4zgbDu7Nl5GQgUirNxj6lNP0EiEP4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vY3yq9h5CtR2y/1Tci7pEa0GcD7LcLoRuyzXb6JpApI=;
 b=cKHkGKfxEjXWrvmsm3gLoEi/HdCObdJdqXBxA16pjtd1TdmB0G1tMYwrPZhTLZjOJrD2TXCng3MtQVJdGYTP+9+0JnQv+1b06V+c9/gM4ksbMUzVLJbSA0isCcfUynMMqTi5zNpug4rZzVcG9Mo2PExSEw/OCM5Dmp1+Gusx3Vw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: dom0less: cope with missing /gic phandle
Date: Fri, 11 Oct 2024 17:19:56 -0400
Message-ID: <20241011211957.447290-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|CY8PR12MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: c5cdf08c-1349-45ca-f329-08dcea3a775b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WZ/tHk7zrabOfx0OvBgw0ndmWyubnhx+f0ixHbmfYEyATPG+cZ+cKqoHHqIL?=
 =?us-ascii?Q?b8CfeTRVIKsxMZsDWVd0Ed/WLI9ARdyBnBFjzzodpkZR+ZniN2tR6yPO7ReX?=
 =?us-ascii?Q?M3LwzyQQFAbFwysleJJEhlw6QWUm01XzQrRQcQC7+GWOZH2maAFfVrnR5mlh?=
 =?us-ascii?Q?NW7OhIWBAlmnojXNXD9QA59BPZfv/0olV7aRCy1Fwj2sUubfrOPOiZKmMuHJ?=
 =?us-ascii?Q?8GJr0/v5zcQFh8zXwFo5awUfqyxFoS2GwGnyme8qMRtoM2tKW8RUMNlhZF4H?=
 =?us-ascii?Q?cHIJiOhAFVAHPhyFvwqpQAGkPD8dP6lvZBBFAYqZG9dxPDr/wbfaP2+H5tLh?=
 =?us-ascii?Q?OLzRkuSAOry0ClvqCLhhkBin5xNxFs5+JZ+HA3SPrBZcYWGVmtByG8+txOsH?=
 =?us-ascii?Q?4D+1SN/NX1NtUBbius5GB6rZtpmXW5pKh4UNPS1c/wBWqCOTnn+XGJCixcV4?=
 =?us-ascii?Q?ySLRhbvdCProoV436o/BUpGywDh/5MNYKfgjsCU8pv/Iu3/VLLRro8uLTroJ?=
 =?us-ascii?Q?n5f74zOAxWQA/njylCImRKslc9MCLfGSebjDX//i189oVv+qIesn2u8EKF5h?=
 =?us-ascii?Q?y8vp1HXyTmcTgWflA+3NwrOkRnkOQEywW7bAypYz6XLZforQJz3HoAdHUjmQ?=
 =?us-ascii?Q?w8kRedipbPxDYxA7tAFC5sBqF7ONZ4O+m5wvC5OXuJMD224GFijbFGx3+/6j?=
 =?us-ascii?Q?3XlDXFMCcu3fQBWaYb3Rs61a4gZ/+MTbHMzK7+T/7z8tScyMslt/iibDrGk8?=
 =?us-ascii?Q?FAoFGICT7vU2iV9TQ5NfDa+3/OWvJPobCWub9/Efv0s1VWH5Q3Qr+WyTvi6J?=
 =?us-ascii?Q?DCUIIKm6/jAf2K932prIxmE7vxs3fNXrZfZc52NhUCKJXeLG+W3+zBDzmj2d?=
 =?us-ascii?Q?Dp2K8Cib7HfOmP035Yeo7r5g3dLzY+4xKxTvswDXgfGHpNgkIaOPLcXw+vUA?=
 =?us-ascii?Q?vt2hiXmcQGLrthFRIDfLif69UahxqfayTIoszlQOiPQopwrXtJOXVE/2trPF?=
 =?us-ascii?Q?U+Qr2o/bBfu6nANgzwfkpwcHIQshFA/SWEinEpUXXeXtwyo3sL5km5xR2Kou?=
 =?us-ascii?Q?9uanlKhFkEWSMGzXuxG5onSxJdOiMXBqNpG7W3nanbFH71of8PhVyDOR/VmV?=
 =?us-ascii?Q?UDn2XYJVzZpPT64pSChOdUB0CoWE7nlpUykD6A0vJpzB9AHV2NXAetwKvYC1?=
 =?us-ascii?Q?ZqeSAB7su8/KgVC575UuyKC9nn35+txHnO3h2zn9taFpHvO8NbS/MSfVKNBn?=
 =?us-ascii?Q?V7anV2TUsV419XZO+ohXIgOSsdmnxeuHgcUweAUIMpi/cl84f6NFsTKFvcwD?=
 =?us-ascii?Q?1Nj24gkDqo38CaLX6t4yP85deiztiUr4+22jO4yC2QRUOZTum3ssob3AETBQ?=
 =?us-ascii?Q?IZjhGjg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 21:20:01.0504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cdf08c-1349-45ca-f329-08dcea3a775b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7265

If a partial DT has a /gic node, but no references to it, dtc may omit
the phandle property. With the phandle property missing,
fdt_get_phandle() returns 0, leading Xen to generate a malformed domU
dtb due to invalid interrupt-parent phandle references. 0 is an invalid
phandle value. Add a zero check, and fall back to GUEST_PHANDLE_GIC.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/dom0less-build.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 09b65e44aed3..f328a044e9d3 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -554,7 +554,10 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
          */
         if ( dt_node_cmp(name, "gic") == 0 )
         {
-            kinfo->phandle_gic = fdt_get_phandle(pfdt, node_next);
+            uint32_t phandle_gic = fdt_get_phandle(pfdt, node_next);
+
+            if ( phandle_gic != 0 )
+                kinfo->phandle_gic = phandle_gic;
             continue;
         }
 

base-commit: 76a54badf890f56ff72644593c0fbc72138e13aa
-- 
2.47.0


