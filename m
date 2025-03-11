Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA6A5D095
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:14:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909055.1316134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5zA-0007SX-8h; Tue, 11 Mar 2025 20:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909055.1316134; Tue, 11 Mar 2025 20:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5zA-0007QO-42; Tue, 11 Mar 2025 20:13:56 +0000
Received: by outflank-mailman (input) for mailman id 909055;
 Tue, 11 Mar 2025 20:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jJT=V6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ts5z8-0007Om-S4
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 20:13:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2412::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 596ce305-feb5-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 21:13:53 +0100 (CET)
Received: from MW2PR16CA0043.namprd16.prod.outlook.com (2603:10b6:907:1::20)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 20:13:47 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::ee) by MW2PR16CA0043.outlook.office365.com
 (2603:10b6:907:1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.24 via Frontend Transport; Tue,
 11 Mar 2025 20:13:47 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 20:13:46 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 15:13:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 15:13:45 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 11 Mar 2025 15:13:44 -0500
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
X-Inumbo-ID: 596ce305-feb5-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vktNRAzL13EwQwecDIgsmFncbikwgvwpRXizKI6XE6Efg082ggV6jfLIeMAhJtRgTrt22h+vfqkmU3bPL9qOtF01GveP2s/M/lDIT3P1Zi/A1EaMZaJ2YVuCvTVozew1/WKFkQ8zw3VM/yQxHOPfgwg1aP6JapegybYD2X/OARUqdJjzDXpG9rraCc2XqIy5E0zKb7LU6QLONISPzql/ows486zRBEC258D52WNvPe3fR7wZnI7UcytygjnV7W4NWsC429Xbs+FaAcpfHwrPJCrNL5wUCopZBkfcZB87AnkW8aB9RaTS70M4GqTxf4Et+tIMJ6zEOtjx41Np7lM00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWC1ZmRyzVKf29WtlD1YmvsLfF7BuCPZ18tLYB4GxzQ=;
 b=wFrft5+h88LBJHchHhayKAmNCRFisHJxCO8Mh6rtuy1+j98cyWb5BxHKc4rhF3cdB2gvhm/J0TXy527ZHFOyHUnZQeB28upIbEaQEYktyttiAnqDo9OmRgpz/hs29WJuPdDOQa73kjRbZvqzI2QQpy0z35wp4VZ1QsJI1MhCLCgvb7OuzbgDYYwF7eB5g/0mhcGQ5zLqdkNzDDDIJ6HKyhWyhrGEiscnwxTRo9GW5pvwNBvvRocr9hh9JC7jWAkiIXsmqbqlnvsct95CyJP7xKcmu/pByfKiYYBmGCTlOSZ9WldSRBsjAzoEvihozjDu9628l4dujf27+28ULN7+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWC1ZmRyzVKf29WtlD1YmvsLfF7BuCPZ18tLYB4GxzQ=;
 b=aAe4jDE3tM2UK0Kf5aNHUCL3nNvBVwDsttuvAl+wEqFYusMVk/mde4q35y8ZuNKAV7hgg3tNAXVKHwmiMqRx8PukMTblk9vVdnmqjWB1UJXA0bHByYOpFEDNAqVOKVJSWVUs0FaqguOeb4ufD7Pf//3FiRQ7d1Bp5lQt9E4bzKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v17 2/2] xen/arm: check read handler behavior
Date: Tue, 11 Mar 2025 16:13:28 -0400
Message-ID: <20250311201330.365499-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311201330.365499-1-stewart.hildebrand@amd.com>
References: <20250311201330.365499-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebdf3d1-22b5-4eea-abff-08dd60d93b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTVieG9BdFNvU2ZPV0F6dFlYenF6RnpLM243Sk15WkNlTVVKN2NRb3NQV01I?=
 =?utf-8?B?ellHbkw4QU0reW1wRmpGTStqWEYwQmNYQmtpTmxBRXoyWWR3d1lEQW96aGZx?=
 =?utf-8?B?RXF4Zjl3eGlLU3ZxajhTakFhUlFWVkROak5jdjh1cUtzVnJ0SE9GM2ZFdXRl?=
 =?utf-8?B?eFU2Q25wc09lMi9PeFJKWVFqandiTkEwN3ZXc2U0ZHZ1STFncnUyUnpoZmMv?=
 =?utf-8?B?VitKay9QY0RDZTJGVU1rM1NzWDJmSlBsUEZKVm9kUk1HdDhKbUZkeDBGaHk2?=
 =?utf-8?B?ZVowbkNuVUVQNGtqcnlKUzhaeWdtN21NRm9EaGd5djNISldGWFcwWXNDVmlw?=
 =?utf-8?B?bndVV0RDUERYd0pRQkJVSHAxbGJYcHBLdE5zMVpuaERZY3VrNlovNE1FZUk1?=
 =?utf-8?B?eDFrZno3Mi9CWjQ4TWVpbVlsMmVnYWwweXpPUjhhNVVyc21KOC83WHEyYUZ1?=
 =?utf-8?B?UElLcXhWWWxZTHUrcExZTFVoVHVLMDdYN2w1YjNNZGdodHZhMGprNE5NOVhs?=
 =?utf-8?B?N1BqSG0rckl2Z1ZTWEJWbmNkRVlNaytYQ25JRkRqRU1QaW9tZ2hrV3VUU21V?=
 =?utf-8?B?WGFzWVZqeENvc25hVmZKWkN4WHRBZWYrb1MvSDUwRWJJOGRDQ0w1L1VjcHJu?=
 =?utf-8?B?ZWRISzQvY2t1QjRHZFMwbHRidXluZnN3Q3dQS1NMckdwTHVIaCtwSzdSYXVU?=
 =?utf-8?B?M3BBWDRiOWhCYVpoSnN2TTJ3dWtXVi8vWTdSREJ3amZ4SE4ybTVuWFhKVFJV?=
 =?utf-8?B?Q0ZGRnFFaDN0R2JzRllGZXNvN1liMmJGdWpCMjhOdUNGOUNGSVprUElRdkhY?=
 =?utf-8?B?STJENnY5UmdEeEYxY1VTRU5KS2IwbjhWZkxBWDduazlFeUMyd0QrbytDVXph?=
 =?utf-8?B?UmFmazJPNWkwYTlCQWlXbmpWbmExejcvZkJBNjlNdGFTWW1EQ2lTQ2xaN3hl?=
 =?utf-8?B?eUJzaVkxdXk5bld0dDZSdXB4VFBxRysvNHRwV3hVcVdyczV1UWZ1Z3VmK25X?=
 =?utf-8?B?MUFnR01zeEdOOUVMWVMva1JFUXBkVVc2SUtvWEV3Q005THVkMVVqYStXVldp?=
 =?utf-8?B?MkhCZnRIenJISHhKRzVWOXhucjh1UEVpdWdhdGZXMzVsTkZwTDBvWVJURUY3?=
 =?utf-8?B?SXUvNnlCNU10MlBUaXQ5V3JrKzF1Z3RiRXlrOVBwRkhmc3V5L2VUZWt3eWJO?=
 =?utf-8?B?UE5RemdJZTNSZ2QraGhhcGw5TVNQeVpSUHE1YlFrKzJnUzl3bW5QMTR5U0Zp?=
 =?utf-8?B?WVF2VnoxM3UveTVmZVd3U3VpNDNOTExwVm5vQXJ4aXJ0UUt2aE9kNXhCTmJ3?=
 =?utf-8?B?MFFTWm50aG9UaFFhZS9KYXl0bEk2WWoyTnV0dUdBLzNaZnh1ZDZtd0ZNcEF3?=
 =?utf-8?B?MVdraE5qaFdqN2ZiUFE2TlhPSE40L3lNMksyTGEwNkpKME1laFljbS9kdzVH?=
 =?utf-8?B?TEZwWXNqc2pFUU93OGJBMWt6Y0ZDaVdXSWloTWI4QUZwdnJ5V2Z3dTNKN3Vw?=
 =?utf-8?B?WEc2REUvazFvZUxFL1A5QTBjdjlLRzB0RDArK09ScEVQY2Z1dUZ3MjlEa2lT?=
 =?utf-8?B?M1h6V3BlbUxPdTQ3NXJ2aTRwb3dycHJxUTdPMGIrQmQrZE56Uy9ycURaREh6?=
 =?utf-8?B?aE9lMkM2Q1EyZnBnSmFDVjJiZ2pDSFBXamJ6WWdpVjQwWmcxU3BSVnpGNnBj?=
 =?utf-8?B?VC9nR1RRaW9IMWFhdzZQN055VHA0cDBMcU9PR00xUWlEczhBUEloMjlGT1o5?=
 =?utf-8?B?VnlIenFNMXNWYTVyUE91N2RlNVlsZE00V1VtRFlQZnoxSmQvYmUxc1hLMzN6?=
 =?utf-8?B?NHZNN05aNElObVJZM2V5Q2hjd25MK1VYQ2Y2L1hSUEVUeWNtbDhxVDBNcWo3?=
 =?utf-8?B?cm1ZY0szZnlBWXpmNGJWaCtJenk0RVZqUW1YOEo2WWVDREM3RWw2Vm91SXFJ?=
 =?utf-8?B?SC9iRVUvZEcxSmVPL2xNalY3eEh6QmxqRXRaNkFPankya01hcjlLQTlLY0pz?=
 =?utf-8?Q?g72Qds8SP1UbqarOezYDwvBPhIjyrc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 20:13:46.9902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebdf3d1-22b5-4eea-abff-08dd60d93b0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350

We expect mmio read handlers to leave the bits above the access size
zeroed. Add an ASSERT to check this aspect of read handler behavior.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v16->v17:
* new patch

See https://lore.kernel.org/xen-devel/bc6660ef-59f1-4514-9792-067d987e3fbc@xen.org/

Also see 7db7bd0f319f ("arm/vpci: honor access size when returning an error")

Also see xen/arch/arm/ioreq.c:handle_ioserv()
---
 xen/arch/arm/io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 653428e16c1f..68b5dca70026 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -37,6 +37,8 @@ static enum io_state handle_read(const struct mmio_handler *handler,
     if ( !handler->ops->read(v, info, &r, handler->priv) )
         return IO_ABORT;
 
+    ASSERT((r & ~GENMASK_ULL((1U << info->dabt.size) * 8 - 1, 0)) == 0);
+
     r = sign_extend(dabt, r);
 
     set_user_reg(regs, dabt.reg, r);
-- 
2.48.1


