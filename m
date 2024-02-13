Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4587853EC7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 23:34:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680155.1058082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1LV-0007L2-QB; Tue, 13 Feb 2024 22:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680155.1058082; Tue, 13 Feb 2024 22:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra1LV-0007Hn-KL; Tue, 13 Feb 2024 22:33:45 +0000
Received: by outflank-mailman (input) for mailman id 680155;
 Tue, 13 Feb 2024 22:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFBu=JW=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ra1LU-0006lq-6L
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 22:33:44 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f10b30f7-cabf-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 23:33:42 +0100 (CET)
Received: from MW4PR03CA0174.namprd03.prod.outlook.com (2603:10b6:303:8d::29)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Tue, 13 Feb
 2024 22:33:39 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::dc) by MW4PR03CA0174.outlook.office365.com
 (2603:10b6:303:8d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.41 via Frontend
 Transport; Tue, 13 Feb 2024 22:33:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 22:33:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 16:33:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 16:33:38 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 13 Feb 2024 16:33:37 -0600
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
X-Inumbo-ID: f10b30f7-cabf-11ee-8a4d-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOwfAcMZPgHCWxG/koGBqR4f3sex3ECXOf/H6hVdb4rVQyYgDQ6mtxr9Z2GOprDQ7+vWanoftorv7YJkSopXVXVU+/AmjOnMMRaz1GWhVA74fyBCUMMhQG7HLCHO3H8EnraataC4R9zheSTffg55lBbf6zuK7XkSiR6S77UliKsQb23xxiG+UP6ZNsEz4iJ/MXvKOXWXM5YjLevydoomDmPK/qmsFkjtZh6GdDpmZkkABWrjdyFTV/mQkxupcw1PZMyCYyAVkdkm3PFwNnTAB7CdR8252v1+8toUzlTlIZFXGssQSX18grwYP22xjHPImpu+k6lmTGPxnjVnlm/ebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMlULJhvmyTxrcJKAvuzeEpM4IUs0jtR0Nuwpoxpqos=;
 b=m2gllIaQRPdwmog3iuLQgUsehqvLIQIQDtj4gpEDrIzop8afxHCQXjhOB35Vrb9q/yGZj2eaCx/PZ/+tyN2i8AXGoC+KxmmPiSXZ05Da4d5YYxG6C2K6xG0BXFUwCn5dLI0jibQBCB7kJ2EtYVdzShXTTgG1pWarAlmf5Im0YqoZTT0Zf30JPDxooZUwojhKlWcfGoWjah70sJPxP5wfpMqOlFT9dn8tiugmlwR83tFk6yn7dEFPXLFbd/ptuanVchwIT+uCM0Hc8JvAz5ZF70ncyVON4M8MHu6wrLFzGu/Gu1kDBIQiEliewII0pEV409oY6Ie71gbdGG6KyBJpjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMlULJhvmyTxrcJKAvuzeEpM4IUs0jtR0Nuwpoxpqos=;
 b=X7eLJEDNXlB6nzEFZESC94f81TK51C55nUd0LfKdkTSl54bs99YIpMDIsC4tLRS1iqq2kfl2UV/dKbn9Gcr/dM/v4RLdicUfL1zGCYH3ipYVY4cdg+ilVHi054wtO3svQgwQFba8tNw8UhVg4/2+QvuMQ/cgfmK7yZ47aVsyDQ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <george.dunlap@citrix.com>, <julien@xen.org>,
	<bertrannd.marquis@arm.com>, <roger.pau@citrix.com>,
	<roberto.bagnara@bugseng.com>, <federico.serafini@bugseng.com>
Subject: [PATCH v2 3/3] docs/misra/rules.rst: add rule 14.4
Date: Tue, 13 Feb 2024 14:33:34 -0800
Message-ID: <20240213223334.3693410-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da4ff8e-5b8a-499c-36bd-08dc2ce3d36e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HMqEZAmaelDMIsmHF6y+F9dPA0Qd4cWV6apIzEhAm4KJkQNFalJ2grwndN+/h/Jx+kWPbMxPkj1hcbAcTXr0ex/tkjPGVksvg3rGFc/AdegOHtUUFb8V46EOUmY2uVfgzn8qxJb3Czdcs4UuV8dsFbhK7vnb4BvffvRseI/SD6Dbp14+PYyhqO0cbQ0upL0OcwldN2ruX+qX2XWB5BTcM4yHyFmaprXwbnlBJ3uKNhislW8NxbIF76BgpukfBL/LxAy+doLsZz618Njl9Af4vDX5DRMtLbp9THhrQeG6RVx6bi4DYRTy81uBAdmkMgjfEjexinq1aWwmal6wUMHeQJxuu4k2MusGCo08w0Us3gLwwCYcDpJNBhqDrxq2ZJwQu6SK1g+SJyidknH2YrQ97i16uQUDfaU30EKCZqkzoRyFGwYXsUWs7gwTDS8OYONeTpr62AuwSiZcOm2hVhLh8ivwR7+kIEsvJFRpm/QHg6iPO0rYshigFMunu1L55OhUeEbaLIgp+hCpRlyWkEbJLWZeVE2Zhm0o8vArNIKW0KTLDp7nxno10pEja69H/KdMGvKwS5YqjOIQl3R06R0nGV4ieWiR+2NrFGRjhic8SIM0cCYuuZbNq5Unol7gXuWx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(4326008)(41300700001)(8936002)(44832011)(8676002)(356005)(86362001)(82740400003)(81166007)(36756003)(2616005)(54906003)(316002)(6916009)(336012)(6666004)(426003)(1076003)(70586007)(70206006)(478600001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 22:33:39.4619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da4ff8e-5b8a-499c-36bd-08dc2ce3d36e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 931158b354..3e6f94d7bd 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -468,6 +468,15 @@ maintainers if you want to suggest a change.
 
        while(0) and while(1) and alike are allowed.
 
+   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
+     - Required
+     - The controlling expression of an if-statement and the controlling
+       expression of an iteration-statement shall have essentially
+       Boolean type
+     - Automatic conversions of integer types to bool are permitted.
+       Automatic conversions of pointer types to bool are permitted.
+       This rule still applies to enum types.
+
    * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
      - Required
      - An unconditional break statement shall terminate every
-- 
2.25.1


