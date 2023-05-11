Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D123E6FF081
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 13:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533266.829774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4Qm-0007Cs-9j; Thu, 11 May 2023 11:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533266.829774; Thu, 11 May 2023 11:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px4Qm-00079m-6a; Thu, 11 May 2023 11:25:56 +0000
Received: by outflank-mailman (input) for mailman id 533266;
 Thu, 11 May 2023 11:25:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/UO=BA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1px4Qj-00079g-OC
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 11:25:53 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 957d64ed-efee-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 13:25:51 +0200 (CEST)
Received: from MW4PR04CA0354.namprd04.prod.outlook.com (2603:10b6:303:8a::29)
 by DM4PR12MB8558.namprd12.prod.outlook.com (2603:10b6:8:187::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Thu, 11 May
 2023 11:25:37 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::76) by MW4PR04CA0354.outlook.office365.com
 (2603:10b6:303:8a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Thu, 11 May 2023 11:25:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.21 via Frontend Transport; Thu, 11 May 2023 11:25:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 06:25:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 06:25:34 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 11 May 2023 06:25:33 -0500
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
X-Inumbo-ID: 957d64ed-efee-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQLHv2Ry8uXWR+tiaRUVug+11wmkCBinZQu7LPLVIjKbODYL713uVw7glKIQMP2CAd48z8htzd8GNANdTk0B1wP5FQXI1aAVaWzIWN5cY3Il2T1q1Pm4cWQYBvGnMsrBBA+vNDEz/48ZS8xFHlI86KxOvnDI29717P+dKkkYd7YPRhsuF+gkv6yVC/PLXKdTVjtCBwfPCeKwfmMhC8UAjTUBRkye+//KpJZr6hNXcJjCixpk1rv9hNo40l4d7BrDo8Wm/r+EzXRywlldVXmJLwl9tEG3lIaXbQU5E+PjpuOLHg0Dks4Z0fWMo/K/N/6ncJeyElaquXg4O44Bwc7nVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3ofw8QlulpeonaWRaWUpbP/xOt0kD1++n4rLpxTc3I=;
 b=fntYdlp4umvT14KNV4f1eWwuk+7LkzSAHjb7NFp7AMqiGaRVpk8Qy61byVPsPjq8/wfDv5oi+mD7D/79zLsfNcE7DD9HDma7iaa8J3dJBNRJI7FFgI8W610FIKUtQj0RhBzawzFFv/veAoEMMROiSGypYkSL3Swl/PWJ8qOPw4QANhT/hTZlNwpsY8ulEEVXPtUDVRnWNjZBl88LuBN7Py0Dz3qbfeFg6vBrGzcZoc8YN5i4Rkdv7tV30wAnY8vH2s+sif8Rm+CLUK2Ko6ppGas4y/z6VRqHrf0ZLdAc8Mcg6NtsQx0QX02HKy8qI6NkomrEg5cxezcYcvtCUe/oLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3ofw8QlulpeonaWRaWUpbP/xOt0kD1++n4rLpxTc3I=;
 b=NPUurkfWL2FQcEXqJIBm4UtA5l5bR6Y/9HwWRAPUwpeX5MKWwbkclQ25CQjI2MmoslCCzpkL4ihmuMcj0agYNzBhR+OsjItCLoyEZJjIkM9CqrQm9buwgLVFxXHf13QW9VcoW8c/ZmadQ8w3z1rCbhOPDiXgIoUP3ObhUcIpWGE=
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
Subject: [PATCH] xen/arm: domain_build: Propagate return code of map_irq_to_domain()
Date: Thu, 11 May 2023 13:25:31 +0200
Message-ID: <20230511112531.705-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT020:EE_|DM4PR12MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c4e5d0-f6e6-4148-8c1f-08db52127113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qyok2kwuWwXOC+3igOs0sr20Id1Fow11Zw9kbSZYnohNP8ZLCNU5ARrpBxDkzKfQ/3/kjYFWUXE0Ft2ogCb470If63huCqujOaI6i0Vq5ZTb9FvNRP5IKlHbYQ2n04py1cxsaTFmneIcJys5MgBPcVeRabGI/mE0t5ji6xuF5GrH5zFsymQIIU98FhEw7ywx2u/x3jiX7m1Z2fZJdvEfddHk9xOmMcnTwypgFMPeEZ96Z7sgByLavWCJLXMKZyrBnORvdLCFl3iC48NuqjyTWxS/2xIylMaPAvu4IbZVyHleBAeWUOvKwojCCQDW+ByDxL0Oi4C63R/nSnA+ecS7+2Cfbpp2+pX4JwxkRfhpbntUb3mzKmURNQxYA6IvW4LhF6aNM068IPY868uS/naBHD0ZRW/XiSluEhnd/QSRhkP2DStibwkAPo4quQgqcMCTh0FCwS2QIYErZU/SCFyL56etKWaRJa6xpeaiWtpJiUnYJAW2y0j2gdexoesl8cA8VXYTBRpbe1mne4QIYiPrQ7fbDwZD+aSV+euvvfFL7MJtCOY59nv+ai5dbKmG373YXS30Qsdhl7VfqFg4IT9n7QYB6LKlNQqC0lgECf6jm8W4OpPBtnlZdoZRv2MuPj6gDeoHfctKbVBptfShSc5Q5Wo+S4l38AQH6HuEjKZBug3l2V70dmnogTfNDowpuniatAZRO8t/MyqS8MydKln+5T+VMGpKC1n5Dpoh2VhWSbom+hKOeoLoIeFgxsAbkRGol9iG0hv0BPLDZif5a+/Yjw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(2616005)(186003)(478600001)(40460700003)(36756003)(44832011)(356005)(40480700001)(316002)(41300700001)(26005)(82740400003)(83380400001)(81166007)(47076005)(1076003)(54906003)(70586007)(4326008)(6916009)(5660300002)(8676002)(70206006)(426003)(86362001)(336012)(36860700001)(8936002)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 11:25:36.1333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c4e5d0-f6e6-4148-8c1f-08db52127113
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8558

From map_dt_irq_to_domain() we are assigning a return code of
map_irq_to_domain() to a variable without checking it for an error.
Fix it by propagating the return code directly since this is the last
call.

Take the opportunity to use the correct printk() format specifiers,
since both irq and domain id are of unsigned types.

Fixes: 467e5cbb2ffc ("xen: arm: consolidate mmio and irq mapping to dom0")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f80fdd1af206..2c14718bff87 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2303,7 +2303,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
 
     if ( irq < NR_LOCAL_IRQS )
     {
-        printk(XENLOG_ERR "%s: IRQ%"PRId32" is not a SPI\n",
+        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n",
                dt_node_name(dev), irq);
         return -EINVAL;
     }
@@ -2313,14 +2313,14 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
     if ( res )
     {
         printk(XENLOG_ERR
-               "%s: Unable to setup IRQ%"PRId32" to dom%d\n",
+               "%s: Unable to setup IRQ%u to dom%u\n",
                dt_node_name(dev), irq, d->domain_id);
         return res;
     }
 
     res = map_irq_to_domain(d, irq, !mr_data->skip_mapping, dt_node_name(dev));
 
-    return 0;
+    return res;
 }
 
 int __init map_range_to_domain(const struct dt_device_node *dev,
-- 
2.25.1


