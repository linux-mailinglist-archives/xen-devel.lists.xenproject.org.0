Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF4F6C6A20
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513887.795585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLRD-0000Jk-GZ; Thu, 23 Mar 2023 13:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513887.795585; Thu, 23 Mar 2023 13:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLRD-0000GD-CW; Thu, 23 Mar 2023 13:57:07 +0000
Received: by outflank-mailman (input) for mailman id 513887;
 Thu, 23 Mar 2023 13:57:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ZVY=7P=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pfLRC-0000G6-9h
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:57:06 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 964f1f0b-c982-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 14:57:04 +0100 (CET)
Received: from BN8PR15CA0046.namprd15.prod.outlook.com (2603:10b6:408:80::23)
 by CH0PR12MB5044.namprd12.prod.outlook.com (2603:10b6:610:e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:57:00 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::6f) by BN8PR15CA0046.outlook.office365.com
 (2603:10b6:408:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Thu, 23 Mar 2023 13:56:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Thu, 23 Mar 2023 13:56:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 08:56:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 08:56:44 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 23 Mar 2023 08:56:43 -0500
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
X-Inumbo-ID: 964f1f0b-c982-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8jcm2gwTREW6O8Y4u8x2sP6CLbUMYRWFr2q5z6RH1MGawSdRBkeceCZ+uCzvslcW5f2VIbkAG3L2sb/JRfdP5NXFDg09/jpDcNER4+BYQJNUE4OzsaMBOon9+VvO2CcW04CdLW0eWtuC3xmPLXlcncsnKNe5pHOExOLRqYFsEBkvTSMc653SCaCuvLhfL4MSArjTIfgm86mXshBWtNG7xVd2zpcY/5E9WEM1jPhJOYcFppZQmQbd5V2s9ht0EWEUXy6UBeUiEaMHsfw5dV1VXzojr+z9ml7rFyXVZLG3w+vJfF+pxBinwzXC6YCUq198+cr41m3Wx3wovM7rz1mXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VBmivoISHzCX6WblJCHDCa7l2kjScABzT2Aj/qIsOE=;
 b=FdhqERuDpGnaVpS6y+uf72O+FblI3RXjWfinkATP0c+csONdK6I0Y+UQW0i+33j41Mqt0UXrE9JVnZHBmzTmqnfpAA51YavuJuxj8s6txC1C5uox8drb1owglyBuLdqDoVszkrG9fUr3OskO58Q87nbzRfGJvk3nV97WsjnDr1WHmyKCYQXsvVf0r1gN4tGMzvjKm8gauzIsq2NEZPz46/dfpejiWv8k8A/MWy/DMK+2kzLR9pikyKyIpowdsQ7Uc6V2z2gKrPb+RJ4ejA3rFHGLORpyf81Fnr4a9a4jZlVlx5tIFR+JayUabwxwvMZVBuOOfjBTAT3IiMNeDocrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VBmivoISHzCX6WblJCHDCa7l2kjScABzT2Aj/qIsOE=;
 b=U+cc/CCZobZj/gOpZnx0jwerw+tUQyAwP7ORMvPp3hEydlnfomPPSrf3CiEC2rvbVZVWq/IQTisRIlWnqRxDe4LHpmWIPRFxRZ2g728pDJM9VnT+T6ItOapoc+5KGCSxRD9u/KBWrg9n1iXYBFASdVbszKu+pZrQbOMfSqLc2+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 1/2] xen/arm: domain_build: Check return code of domain_vpl011_init
Date: Thu, 23 Mar 2023 14:56:35 +0100
Message-ID: <20230323135636.25318-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323135636.25318-1-michal.orzel@amd.com>
References: <20230323135636.25318-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|CH0PR12MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2c88b3-245f-4bdd-a913-08db2ba678e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	368L1CWlS/rdamMmZxOy4UV2R6Vukcc89ZnLTROKySNkgYd5cud91+MJiQ9tZwfFhMcDZL3lg180uCFhUGXsemJIyroTcd5tAc48uUVDtfElKvWq8k2bYQIpvdcTwW/Q4q3HYwUoHe1GsOt5t8HeEI0xTvqbcNyxwVKypJaqZ4X30peXOh21d1E4A/fIl/aWOIWJCkaDVqE01kYwS6Qdl4SGBTOtiZjrzvNf/HDFO6nxMstGc7Ma1WtpVxJraxmYtN/pRHTwuOK9X91XqnCwii0yqgTR7U3sRwupzJlttXoiDdv6ix9FTtD83WpVoSUK9cnHOY+WyvK4xi/9b+viWiptV0/Xhoypfntje8pHT59PRGhQN+lg1GnI1W/XH2/3Vq5rCCHGcAxMr+8CW4KygWHRSmYJ4vFCSBYNTAOq5wV/3zlr+Oj6gUFKVzeNvWzN6Z5fMYs+ZIUmdEq8ryp+zBIlh9OTEvD62A4dOIPogfApQmAAFmgQfM+Tre7oi+SpN5N8yeoKe6SKePsCI9tmPP7v42n4SbjiDv4+SVLFe1IJL81PDG336gVTSMqlYzkVjguirL9T/frNr0GVSEqKOyuX3vwVA/uWNBzVy1hkInNVLpvv2J7+RbFHLfMPNeomHtPbYafcLlYst25fIDvuTog5keJYC6dkyHJ1X/lwxvOORk5U1DKE1lE3g9XprkFXOUGqVjKqyYXyFm5fEXBsOqR9b30JdI1tfHHTJUGpluw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(356005)(40480700001)(2906002)(40460700003)(83380400001)(478600001)(2616005)(336012)(186003)(82310400005)(86362001)(36756003)(316002)(36860700001)(54906003)(70586007)(8676002)(4326008)(6916009)(70206006)(8936002)(4744005)(426003)(47076005)(6666004)(1076003)(26005)(81166007)(5660300002)(44832011)(41300700001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:56:59.5340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2c88b3-245f-4bdd-a913-08db2ba678e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5044

We are assigning return code of domain_vpl011_init() to a variable
without checking it for an error. Fix it.

Fixes: 3580c8b2dfc3 ("xen/arm: if direct-map domain use native UART address and IRQ number for vPL011")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v2:
 - none
---
 xen/arch/arm/domain_build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9707eb7b1bb1..3195c5b6d6ac 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3826,7 +3826,11 @@ static int __init construct_domU(struct domain *d,
      * shall be done first.
      */
     if ( kinfo.vpl011 )
+    {
         rc = domain_vpl011_init(d, NULL);
+        if ( rc < 0 )
+            return rc;
+    }
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1


