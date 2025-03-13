Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC7CA5FF4A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 19:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913336.1319416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnLr-0003um-JY; Thu, 13 Mar 2025 18:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913336.1319416; Thu, 13 Mar 2025 18:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsnLr-0003re-GN; Thu, 13 Mar 2025 18:32:15 +0000
Received: by outflank-mailman (input) for mailman id 913336;
 Thu, 13 Mar 2025 18:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eDg6=WA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tsnJN-0008Kg-Dd
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 18:29:41 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f522949-0039-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 19:29:39 +0100 (CET)
Received: from DS7PR03CA0172.namprd03.prod.outlook.com (2603:10b6:5:3b2::27)
 by DS0PR12MB8767.namprd12.prod.outlook.com (2603:10b6:8:14f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 18:29:33 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::86) by DS7PR03CA0172.outlook.office365.com
 (2603:10b6:5:3b2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 18:29:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 18:29:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:29:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 13:29:32 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 13 Mar 2025 13:29:31 -0500
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
X-Inumbo-ID: 1f522949-0039-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knPN3K+pHdd7X5n3AiAb0VY8wgRkMrQQELE9nl2bl6U5qKtg9YClLD6msFZV9yCpUdtfgO+Uk1WT7vgGk5QRDjo3qQE0wwBtFli1J4GRXNexexhtQ4/WzfzdAhZ/rKhwtuYGjZibStZHREaFR7RqfrQZfnXawFczD3ikUKS8UMz/Y8+/dx4j0DYG42ciqq1Bb4Bqx6bY2peKV6NNYrAeuMtyM6DKjrCB/+NOqdzC3KN4VspqDIojZDTcXPUTfuh8uKIYNzcy1RCbkcOHzqOk08gvRciccFROVOhF/xhCOoib4UHipnOF37GlI/NVWBDT0KN4Aj15twjr5IbtzkodPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCCB+2kdz1MjvDwvxyZl5nJ4nx3YF7CxXAPxwOHJhLg=;
 b=kYm0X7AcKkit335bwC0aKn9a6h19XtgDQPZZ1v8cpGDUlbOOzgnKngBrs4oYbZkHHrKZ0kS+xuGd9CgpMrS7r1EHnzdsYitizRSdAx3H748pUWpW/9WIjspJY8RnSMf2chDL8UB3SHIYJfNsjHUH4PyDL/agPyBwmlIHp6B3CAmGGyY3nMRrr1fW+nHXday7uNpse84jiL+pqq6fAn0P9YLDX0Pc9yMusZCFb9wHfY/BqWWszuajUojVG4KCQkl3A6oiKI3eYqX3KIamC6CZn7oNA/rQU7fk+So3JiVJAp1R//fP6N4EKttoP8CD5lfq1cMzqtQbHWbUdGDyereQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCCB+2kdz1MjvDwvxyZl5nJ4nx3YF7CxXAPxwOHJhLg=;
 b=gNSaUugbey0sVX2RBgYHpU3JsNNATZPgasdSJCDbz5OoihaSIFLDZug2UDWxRLiHiJLGxTlm5j11q6/SJmaNoBrbORNJUoGZkPzTo08y5IvtSjxn4tiw/uXpeQ1BYe7g3fM0Pg9j9z3/8uWABCOMLO5SgfWCaae3WPOI8dBwf4I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v2 3/4] xen/arm32: mpu: Implement a dummy enable_secondary_cpu_mm
Date: Thu, 13 Mar 2025 18:28:49 +0000
Message-ID: <20250313182850.1527052-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
References: <20250313182850.1527052-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DS0PR12MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: a76572db-4956-4f8c-7580-08dd625d0097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5AaCStyoJ0dsOtfk417GouM3uAvNsbD3gG6gqR/6FtmCcbXIglXX6n1uXTV2?=
 =?us-ascii?Q?DKth/OM74AHMGnpcdWlsbkF4UVJRCVhUhZ3AzGQOUoSLaK0sKpmV3SW8IxAK?=
 =?us-ascii?Q?YSAI/aTs6AnT29ecrnVox+G96o2kUVFW6WZ2AMXH7AvyECTmZJlin5dr+TTh?=
 =?us-ascii?Q?VFHBMVM9izMwggM6piyWXkf3ybFOdMi75Y56IKQuUYV8nJRsfMCSZz5BZCW3?=
 =?us-ascii?Q?qEZ+Z9yUiapdVa8G3fPSwzP8IUsF4urfndXOGJVkUgM3ZGXOewlaF9EYYnNp?=
 =?us-ascii?Q?0tl13ICCJLK/v3dLD5QNiyKehL+wxnls5ZxL5XdQx6XMpJsgBK58JYRSc61F?=
 =?us-ascii?Q?fryiQoTnPxFVjWF8UuGttwFYypaCJA7S1OIGHTxo85/jS5FaihxEi9PXNsHL?=
 =?us-ascii?Q?dyqIjG9xKpgcP9BZyQvH1Ki/7jt6j65pkEUIVw6TIEbONsF/P/lQaMbBrec8?=
 =?us-ascii?Q?BvsV6VegdhXj+C65a6vxHEVRMpd1ehs1FpSejt9PkeUqamgLNgx93uPjOKVJ?=
 =?us-ascii?Q?XIH8JmdjKe8OMZxhZuIMjYGF/ZV7vRa1YIEm1hSep5tpjC5hPu9GkuBd1cjT?=
 =?us-ascii?Q?/EVFylOJIMpDV6wkWRTGQXEz5aor1sj0GI7iYBOeGI7Y0xjDkvF3uEwWepnW?=
 =?us-ascii?Q?zTk0Tr9+cT4kndL5/UwQ68NThn7VLZmIzgwBr8bSSPkYYFcgSE3SqSJ7v9hM?=
 =?us-ascii?Q?/UU126OfIOFgl23osfM7e6HKVynrdXlHpBOtM21N3dxxhGv+lBkYe1N8K17I?=
 =?us-ascii?Q?mhgt73ISMVvzIbMTieGE0+DCvf8Y5nqYSGI4iRLPL+D1KsyH+bdNYILiLRSV?=
 =?us-ascii?Q?0+vhAeAl8hZRi5rYHJyhC1ibjonAZaXCTMD4/AWHwmRYHj9K/eZK5MepfhFj?=
 =?us-ascii?Q?kBo6rPROXQVJMtJ+EgNnjCrhJyveQr6B5NfFlGAkEe3EMP7ENKwxPNGW/G2T?=
 =?us-ascii?Q?tAkqBqxwJLZXE2OB5oW7Q71qO3O+wIUFfDT8glmmpDsAqmYX1zAlKGCfSs2U?=
 =?us-ascii?Q?x2bEoK5NRn5mrE96ao9lSNJMRcop6Sw+xRBYMhYMGaaMQqezGPx629SYrH9b?=
 =?us-ascii?Q?KqEawhqiSkePXcWQZEchBOgZuM/k8VPbyk+H9w0GB7kFMBhNRC4AluF3VJFw?=
 =?us-ascii?Q?eP0APOzW09WHenaB9aiZeCDrNvfEC/iNugmOnj3FJaR2D/3X3f1zKB66xZ3i?=
 =?us-ascii?Q?7j40TDrp2ukF2AZpO5kLQJSdOpiefNpsu07bVPnClUM8hdzakq2Ria4wLAOK?=
 =?us-ascii?Q?z2WCuQGVGccOKBYwR+5qfyVRzj0ysomXfjpxbtoxKFF65A0D2Nqa6vSRZnzg?=
 =?us-ascii?Q?QOneSmqG04Mb1mGzQCPUP8N3pgRNS1mV0sA5M4LcFk3aSHo7/gd80WmYwiyu?=
 =?us-ascii?Q?nof4APxgfxqn3JWDgu5MLmtGrCKYE641ap+m8HsIvgujTUaIFsHK1XFyNdGr?=
 =?us-ascii?Q?YRRfFNyhL+jnJfN/BhCfSC/eGiAn1tbfqiy1bv1I+FJNq7gpvhOq9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 18:29:33.6478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a76572db-4956-4f8c-7580-08dd625d0097
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8767

Secondary cpus initialization is not yet supported. Thus, we print an
appropriate message and put the secondary cpus in WFE state.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from :-

v1 - 1. Add R-b.

 xen/arch/arm/arm32/mpu/head.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
index 40648ce1a8..b6d31701f2 100644
--- a/xen/arch/arm/arm32/mpu/head.S
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -162,6 +162,16 @@ FUNC(enable_boot_cpu_mm)
     ret
 END(enable_boot_cpu_mm)
 
+/*
+ * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
+ * please the common code.
+ */
+ENTRY(enable_secondary_cpu_mm)
+    PRINT("- SMP not enabled yet -\r\n")
+1:  wfe
+    b 1b
+ENDPROC(enable_secondary_cpu_mm)
+
 /*
  * Local variables:
  * mode: ASM
-- 
2.25.1


