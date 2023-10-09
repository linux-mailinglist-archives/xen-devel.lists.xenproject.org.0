Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F07BEB17
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 21:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614461.955559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwOn-0004Sm-6E; Mon, 09 Oct 2023 19:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614461.955559; Mon, 09 Oct 2023 19:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwOn-0004QC-2M; Mon, 09 Oct 2023 19:58:41 +0000
Received: by outflank-mailman (input) for mailman id 614461;
 Mon, 09 Oct 2023 19:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjZ2=FX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qpwOl-0003BY-Uh
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:58:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e89::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c661224-66de-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 21:58:39 +0200 (CEST)
Received: from MN2PR14CA0024.namprd14.prod.outlook.com (2603:10b6:208:23e::29)
 by PH0PR12MB7840.namprd12.prod.outlook.com (2603:10b6:510:28a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 19:58:34 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::c1) by MN2PR14CA0024.outlook.office365.com
 (2603:10b6:208:23e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37 via Frontend
 Transport; Mon, 9 Oct 2023 19:58:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 19:58:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:58:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:58:33 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 14:58:31 -0500
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
X-Inumbo-ID: 3c661224-66de-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJOZwGEsBeE83cSOr9msavyWscOISD6/IPDPwLViRPbZ4Q72d883YDW3ykht2uDR0ZQMjFKSYVAfpqsBK33kG+3sowM9UcKcCrZLjEfUh8b8wueYh6Na4M06zcuauK9tvysJonuNv4RdLkWAHJVj5K3y19bMHlHTSBWTAyZAG0SNXPipSSqLhM+Vewu5LLW65bBV+OKY2HMLRtea+wIV2QZL398byhTSPBmQ5uvYDRpQpjnXMkcb06E0Hc4Y/dzqcvJaXj8THL8Pl8ypdFZp3CvXPGzz7/1/QrwZUdq2cm5St/oJJMOCc5VFKmO1mOooHFt2ccX0NO+K83d6cxBGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOZmhrmNckz6NkJakVLSz/H8hX/OOGQLeh4TaQxTWhU=;
 b=J2KugG39pg7JAxKg+FDYS9NCrP7yR8wxfiWa0dEwSl8iiyyML0apPMbOBN74f0L2pLbLpDCWv8rOacc0d2sq+GaHFaDT3bl/OK5MgK66W/tZ5rcb3xk1P+MG4yuZrdKFSSABN1c31m8rc5hQX6hYqugX3wsCTSyv+rVS3ZP7WGeaQ4mt9eXaCJrKHqHoc3SV1NqzHkH+jWmfUQhJ1Mq6WVUZLn8me7LcqQzgqailNNU3oqJ3HC5aDFa9UYVwFCOXr/QLe36qIMt6eMGrJGlRPYKO3Yavvoa8V9W1sZI7Rw/f7X2KthR9cElSyFnfzv4GHiCsMpIkVUiM94AIvLKyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOZmhrmNckz6NkJakVLSz/H8hX/OOGQLeh4TaQxTWhU=;
 b=SwoZCxbb1qlbtGR4K8kkDIzfhowXdf732ZI1eJXx9lbU0vJSwezvqQTqz8MNHWvNffNCMGv7HpzoGQ/HB9q46bxMtB4bxfZtt5cRD4HUObXVW6EkF1TithQTqNDVZwcnyFcSigd1dHtjJEF0QnzpyLUzSEhsWFxEL7WROE0XpVA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v3 3/5] xen/arm: make has_vpci() depend on d->arch.has_vpci
Date: Mon, 9 Oct 2023 15:57:42 -0400
Message-ID: <20231009195747.889326-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009195747.889326-1-stewart.hildebrand@amd.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|PH0PR12MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 775c1503-b014-443b-b828-08dbc9021eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TxCCyZBVM1GbquonS/9QKZN/EYaLRIgQV84EYUSoRTp27dREMtSNQZpZfEwkSv54ovsImuOn7XNhU+ZZ0F7zBoxtsNrzgP6Hmg+NYxfBWhojimZyNoXWWDCYsaIm3Ks60jFgDbUD9R+/6wl9saV4ixDthzHLT3Yj0I5S7xFc6f6ezD3dVMAsUcQcwFQwgnT9oRN2LdF4PxFYeOREGaPzGiFfMaW/LqzrQFznrOZ3FyNpJrmWbKBr+atW1bvpeUlt65Byr8bGPebuuOH+WqPr0qAYk6fSqGf2hM4NiRLyzQCWbcWPYX8DYeoPFF2A6l4dlEzy5iaovkdj0rTy5M1o01p2LTvcJqQLOGTLTo8Is7YYT705sXUxbLd9comPva2VAH/ypK7ImZpVfhwZF9Z+zmw0k4vl3lZ3k9f9HVQRIyTtmLK6Ws3EyrrEcND0Z8/NUrD4eWpKdnQ4i+kp+8qpVoE7pAk0P9gfmUXA0qJV+ktcY20W7bFcsdWrQSHKRDyU3GflgYBoA4S4Jlk8mZg8LwcSrKmEA/qiPxHj6SfkiL8mIzhK4dVTr1JA6pheNzdz/XWWS/wbE0Na5f1PyPrYhyr/eaSAmZfApytbLa/CuMm937gWxRvNgxDgQ7jOm9nRXqdz6xn5WYUEFQrmEf0Y9fJcIyke7Jc7HArPURcUrJh+ArNTzR74miLYqqaQpcHYX8I0TLCx9zYCngqaSAsGwxFRxmGBfy/E2WZRepNYqsm03tLomZZ9se5l3k5dCkIPbJ3arUVUsrLnLcLUa/VDmZCujdNENGdENNbVIrRMi6g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(82310400011)(64100799003)(451199024)(186009)(36840700001)(40470700004)(46966006)(356005)(86362001)(81166007)(36756003)(40460700003)(40480700001)(82740400003)(2906002)(966005)(478600001)(41300700001)(8936002)(5660300002)(4326008)(44832011)(8676002)(6666004)(426003)(2616005)(336012)(1076003)(83380400001)(54906003)(36860700001)(316002)(6916009)(70206006)(47076005)(26005)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:58:34.4210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 775c1503-b014-443b-b828-08dbc9021eaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7840

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

VPCI is disabled on ARM. Make it depend on d->arch.has_vpci to enable the PCI
passthrough support on ARM.

While here, remove the comment on the preceding line.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
There are two downstreams [1] [2] that have independently made a version this
change, each with different Signed-off-by's. I simply picked one at random for
the Author: field, and added both Signed-off-by lines. Please let me know if
there are any objections.

v2->v3:
* use d->arch.has_vpci since plumbing struct arch_domain with a vPCI flag

v1->v2:
* add is_hardware_domain check. This will need to be removed after the vPCI
  series [3] is merged.

downstream->v1:
* change to IS_ENABLED(CONFIG_HAS_VPCI) instead of hardcoded to true
* remove the comment on the preceding line

[1] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/27be1729ce8128dbe37275ce7946b2fbd2e5a382
[2] https://github.com/xen-troops/xen/commit/bf12185e6fb2e31db0d8e6ea9ccd8a02abadec17
[3] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
---
 xen/arch/arm/include/asm/domain.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 0a66ed09a617..ebba2c25dceb 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -300,8 +300,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
-/* vPCI is not available on Arm */
-#define has_vpci(d)    ({ (void)(d); false; })
+#define has_vpci(d) ( (d)->arch.has_vpci )
 
 struct arch_vcpu_io {
     struct instr_details dabt_instr; /* when the instruction is decoded */
-- 
2.42.0


