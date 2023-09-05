Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFAF7920BC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 09:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595373.928926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQXW-0003HE-V0; Tue, 05 Sep 2023 07:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595373.928926; Tue, 05 Sep 2023 07:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQXW-0003Ce-Pb; Tue, 05 Sep 2023 07:31:58 +0000
Received: by outflank-mailman (input) for mailman id 595373;
 Tue, 05 Sep 2023 07:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AA/O=EV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdQXV-00038m-3O
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 07:31:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 496e8321-4bbe-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 09:31:55 +0200 (CEST)
Received: from SA9PR13CA0133.namprd13.prod.outlook.com (2603:10b6:806:27::18)
 by DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 07:31:52 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:27:cafe::16) by SA9PR13CA0133.outlook.office365.com
 (2603:10b6:806:27::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.25 via Frontend
 Transport; Tue, 5 Sep 2023 07:31:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 07:31:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 02:31:49 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Tue, 5 Sep 2023 02:31:47 -0500
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
X-Inumbo-ID: 496e8321-4bbe-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd4sco1KaaGMICWmgX7PUZnVBiVqU4E9pbMEGHezIH980GaD3lIYIpv6lGYRWsEa0avOfTsuLRD3ZN32iPyCH0igDowOrBT3RZJUh17g0mJ51KgwvOXOaUA/Jf0pRCq6lFtPV5nkhMpb7e6NV6od7Qgn9wMn1OIuLR48LtJfSmaA90oHydqGKOUuQS/bjWXjnq68X4MwctDcDHNIVcSruuBUNxlzU2MsS5e3UcLb/BxmNzRTg/c6k30jNLUKS2A1hK0eDIAFo+jFjlbbtCx1jSd5HJLlfHXhjvT2NRzMMXLu/4vzTsAJ3lUkQXJC0UB8E2cxkJ+h4RHpiRihLkI+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwVDrVREkEGynMq9B3iITCmc/U6BSq/jOOAsWVt3pQA=;
 b=FQCoGKWgILuLd+lZezBrnQ6KqV0lBPjl1HODhjYrWmJohHN3t6vzCrbHL4f3+LX0FzzSIg557k1swbgX3xa4xW4mLIouSx43WryvZrvBnm76vyTRFW0syhV+77p0g/XxdETPEL6uFxqJ8R3pILqhWyAvZy7cdEt7pDh+h11u7I0LCB7WxwGpCyTs9qV9Y5UJd1YxGwkfPC76F2CUODG+c2IpcvZd6txsDJtbjeIcwD60rBj+Tuaj2dkk3s77Wf+nBvmfegJhqwP3LgF1+aKA3K4wAstfM5T1F58cmC+dknw8bWsQhc6D3d52b3MeDgmsiLZeWuVujaE264O66NSSig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwVDrVREkEGynMq9B3iITCmc/U6BSq/jOOAsWVt3pQA=;
 b=3OUYiK2WPecKpnb7vWEzVRSvbS49+JDn6yvYn8E9JR9NWDmLkeGRsYqFpBkZsW7wx4ppX0RU6dcOUCzBi0k5fsEQtauOZR6eqKFglWM/zhaC85/ihSerSUS/dkqSsG7LiTsExTsni3FLlEs1Tv0rzALZwRC1Xh7qOxIsE/FMs04=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<Henry.Wang@arm.com>
Subject: [PATCH v2 1/2] xen/arm: smmuv3: Add missing U for shifted constant
Date: Tue, 5 Sep 2023 09:31:34 +0200
Message-ID: <20230905073135.12360-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230905073135.12360-1-michal.orzel@amd.com>
References: <20230905073135.12360-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: bd81ed0a-f742-4958-6166-08dbade22b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1gyeYaITHa/ZFj7nbixS9Q9MAhG+EQ4RUGQBw755wnhwkfiZ90MbXWv988xK4MWlc8kejf3SGJYevY2WlvW+w7RwDPlXnSpqXzJWONsblXQA61JgCQBYZkYU8u5Xc0La+1J7xj7mNy+UuYMQnek8bgQrqvi4TnMlBNPh3csvSm6E+Fazv5b0iQjCLOzcoP9jpp9J4k5GnkeJkFVe6LGUK8V8E1/OlnkAPfVm8go/KhdFSM0SRXwSLOYK2XMqnKjQ3jrNRdgl+CpCUgt67Ghm+5nThyJW3TwqY3MUXIq+f5vSJgLCDYfYii2cb6AzgxxpAqzpZUjICkNm9hwJfTzUhkBzxBsyFFdExoWEiZWOy/wStSohmhkIj/Nmra1HX8mVJc6zsoJfeJ3u9AgqrgG7/EyWpmst0V1im/C71kxtqgIzOEOaIzPB9kO2PlZHlIVFnkQg3GoH/cnXm48AhbTNLqOu0yvJb+/wuKuTI+ATrSHa/Z7vmz4hUhXR/DeBI3u5ngRPBQHBuTlg6c+FY0WpRiEkQZ+GNFnLDQkJxwQAyG7sSXSnZP3KhSat8Cthuk2ZaRX1GN1msQAlydjmzkDtJipFS6Lhs39bUfCanUWmD9kVtCn5f4xSz1NDUlPD+OVgvBbP3CjehmU+8Udc1tTcB2qyLQaGnCdy7YI+pYrXLh0iNEnINEqASFHo/Ec3GhLffXtVWFVHaK1LaWKj2hEEfSJXLyw/UkaVA/Fki1Fo2tCrpiRHgK7S0Tp+EDycO/DBraZObRToi1SgFlgZXdByVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(186009)(1800799009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(81166007)(356005)(82740400003)(40480700001)(478600001)(70206006)(70586007)(54906003)(6916009)(41300700001)(316002)(8936002)(4326008)(8676002)(5660300002)(44832011)(36860700001)(6666004)(86362001)(40460700003)(47076005)(26005)(36756003)(83380400001)(2906002)(426003)(1076003)(2616005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:31:50.8315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd81ed0a-f742-4958-6166-08dbade22b9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371

When running with SMMUv3 and UBSAN enabled, the following is printed:

(XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/smmu-v3.c:297:12
(XEN) left shift of 1 by 31 places cannot be represented in type 'int'

This refers to shift in Q_OVERFLOW_FLAG that is missing 'U' suffix.
While there, also fix the same in GBPA_UPDATE.

This should address MISRA Rule 7.2:
    A "u" or "U" suffix shall be applied to all integer constants that
    are represented in an unsigned type

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
 - add Bertrand's Rb
---
 xen/drivers/passthrough/arm/smmu-v3.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index b381ad373845..05f6b1fb7e33 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -87,7 +87,7 @@
 #define CR2_E2H				(1 << 0)
 
 #define ARM_SMMU_GBPA			0x44
-#define GBPA_UPDATE			(1 << 31)
+#define GBPA_UPDATE			(1U << 31)
 #define GBPA_ABORT			(1 << 20)
 
 #define ARM_SMMU_IRQ_CTRL		0x50
@@ -159,7 +159,7 @@
 
 #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
 #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
-#define Q_OVERFLOW_FLAG			(1 << 31)
+#define Q_OVERFLOW_FLAG			(1U << 31)
 #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
 #define Q_ENT(q, p)			((q)->base +			\
 					 Q_IDX(&((q)->llq), p) *	\
-- 
2.25.1


