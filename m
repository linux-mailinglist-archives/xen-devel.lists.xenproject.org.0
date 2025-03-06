Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED1A5594C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904081.1312087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJKB-0004Fa-NG; Thu, 06 Mar 2025 22:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904081.1312087; Thu, 06 Mar 2025 22:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJKB-00046w-CK; Thu, 06 Mar 2025 22:04:15 +0000
Received: by outflank-mailman (input) for mailman id 904081;
 Thu, 06 Mar 2025 22:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJK9-0000St-Ai
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee8f6afe-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:11 +0100 (CET)
Received: from BL0PR02CA0053.namprd02.prod.outlook.com (2603:10b6:207:3d::30)
 by DM4PR12MB8499.namprd12.prod.outlook.com (2603:10b6:8:181::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 22:04:07 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:207:3d:cafe::c3) by BL0PR02CA0053.outlook.office365.com
 (2603:10b6:207:3d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:07 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:06 -0600
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
X-Inumbo-ID: ee8f6afe-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymiJ3kJPO2/IAiytx0EQF2xpcxtd9zAIBXkQ/FuswW022g+VUyyslLoj5Ujnqs2ZU6hcR4eBnpfom2mv3tv9Fza9yqK5NpbQJDb/hgJBGFv+HQvuNfHXIeqlAyS6lLlXgj0uH89W+RhBiJTZPA/lo80NS0SKvGuhO5f3J8edJYaGMi2oeyVqGheHwCEopzqxEuLSWP/CXfMsv5WDRcuIx6PidUV/kpNDto4AaiWo9zF5yQlg6WWYFrWijNC/yigGQyzw+REnfvhh/67lgIeM6wS2GaHOdW+kdBX9a/VmxXENCMMnFXqHe8jWnzfh9OevHwDp50yi2bnhpI2wOYUGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEDVZclDoayKYIruSx6CXgaFNq+WT+jOC46+4RZTaGA=;
 b=xNVdQHMDe0bZDLes+IeDc3zJRQ7u2r9mJbVq0NlrRIebPFjaL2CZXDBZoKtCJdZKLqzrkWRMM6ozle7CwUZEpMKleAStRNZpjLLdH2EaNabkBt/BfGY3l6Fnk+5fY/5S/H1EobwCSpD8prkeTxRLG9nViOk7DQw/dyV3OPEbZ7ciUtP3RCfmAPiByDyPiR/T8RSMNEiYlEEz+PsgrirWgB8oalV9prlrldRSx8oOqjk3dv8ccPqN2z+CGE3BbPxhNvtWAMmYtAi8mQkGa7XBeBCnpme39JrWdI0w3LLIiT49MLHE6lIF26pyIJFJJza0Dqcq0FHki/XrE9mvHeKQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEDVZclDoayKYIruSx6CXgaFNq+WT+jOC46+4RZTaGA=;
 b=vIvxLt5YuAqZYYTP39WCnOUZaAHrq5DAFRhBiW4EcvIR9DTf+BVoI+CFHTP7L6DMaDHe9A3o1HyrdZRlMNDEGL6zHKZmctvFTi4x0OGkolkepGlOdPmDD1wjvtbe0rYWrUvUNZixkj6sMgZ74NaLJ2bnt1+puLdcPvZOBehsZ14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 16/23] xsm/dummy: Allow hwdom xen_version
Date: Thu, 6 Mar 2025 17:03:36 -0500
Message-ID: <20250306220343.203047-17-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|DM4PR12MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 953713ad-696f-410a-1e8e-08dd5cfad136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?imTtpSo1j7vf396hrmWr7dIbRIV3f04ipIiQoYSG5bbQ2IiSZe0uutHFGoGc?=
 =?us-ascii?Q?jLEBJ3fBYm+2Cl2bmS1nNzP49KwBk3vMldYPrL9VKyNlgp9L6lxLhpVX760H?=
 =?us-ascii?Q?uchf1c8ObumNMaQm4ELsnrLPigT0YU/hRlgJdPwrhEIaTPK1ANsgbk9bs/4W?=
 =?us-ascii?Q?C0Ls4zuQVd1ggi8e6Dh9xtiE4dMH5A/4FgbnGDTa/CUHXjjrJA4DglI+0pvc?=
 =?us-ascii?Q?GoS09HWTkkkhYYGqHMYswTpMcJJc8c9hGkGTJZbBeUlLq0jsVQqvtUG6BO12?=
 =?us-ascii?Q?p3aqjZkwMY8ELSadHrxtTiyLzmouL/RflRqC1i9YnU2yDYha7Wxk3G9VC720?=
 =?us-ascii?Q?sXEt/3EsSkD0eg3+SZqg0msWR+d3fI3zCs3cTlxkMqzNSkZMh0UsBCCFAErK?=
 =?us-ascii?Q?nPLbSdDEQSZJrRsAl74HPHSgYjRN2hcHPnNCmnaFEiU2RMoPFv311fo7LtHg?=
 =?us-ascii?Q?7v8WNpCF7pym040PubPJDnVRBTS7dgZfwmmECu/HYDewIDOguKD7NoSiv+Pe?=
 =?us-ascii?Q?b0vwPENhCZqCNwna7Z06NFyABbF7QdOoT/8imRcOfx5nzB8e91+7CqMeuXbe?=
 =?us-ascii?Q?1k/YdmqPMPc6i3ScS/uof5w4S9SQuF98nqKYg4O+23vVw2dgabjsct1zNMHu?=
 =?us-ascii?Q?32KmV217XaNhw9ujctPDphFTzqOZHIZvnm5BKXPUb3qN+eGCVQQDp6VYdnHo?=
 =?us-ascii?Q?LHB2uPa6ZwuOav+3quyxxXmf7nNGHGgYorSeyYMWcXL293xtdMDB/2C5GV+e?=
 =?us-ascii?Q?HEoHykDZw14wW0lKOrT/WOjb7jRq4eMB/X+QdXN+KYJF4c/dkhrV9EOwDfRJ?=
 =?us-ascii?Q?svkAd2aHK46gqfaW4yJOGLL2sH+yTBOzLg7cgHVDNE6PxDq7KH7WQAYS/+yx?=
 =?us-ascii?Q?0Uvj4Bo1Sz0mUDlJy/ccTI7mZdKcLTcjyy5kfVxVkmBdY2Qlb1oSR97QyP22?=
 =?us-ascii?Q?MGUDWULAMkBAhFA+Y+tw9oVju/9dUx+TpArNvh8XiL4kObwfJ5pr9hU81Oab?=
 =?us-ascii?Q?wE1u5yem5oCXiYK8WccsSrKn/prdmIyAagUU3WEz26+YFQsiXzzNkAnI0S2o?=
 =?us-ascii?Q?po3Ed1xGWcJYOdtnddHZ6LbktoLJTQqe+qSTotcE5qRz02DhVSGnyBm6dqK+?=
 =?us-ascii?Q?TFixATnbAWzhaEbusSxkfEbvq1fp5716S6/S4krvJwXl5TBTLcQh5+MR3bdS?=
 =?us-ascii?Q?Z1DBq+483l4uYi7p9ONnjvidhAeCXMSYTVeuSQlSaWX9/t8FgFURVbkKBInP?=
 =?us-ascii?Q?QzS9lqXtE87MVCDDK2AenX9GWqmnVcjfHzT9Eb+soS8n5vj7QUqAQqdd6WZy?=
 =?us-ascii?Q?1XneqhxBRH/aGKuU0uuGky+pQ/yxiEAjHLHJs3cT1H/sENJSMLVD8USKOsqi?=
 =?us-ascii?Q?p46Tqpk0uTusXfixHEVNXRSZKs62pnryMxuPBgqEuYpOdBWggdzmkBuwsj7d?=
 =?us-ascii?Q?OAHWhmCi0c7/JNxeii0A/tyDYfs4882Zt7jZcDCWWfx62AyBMWIFQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:07.7574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953713ad-696f-410a-1e8e-08dd5cfad136
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8499

Running xl queries XENVER_commandline and XENVER_build_id.  The hardware
domain should have access to the command line.  The hardware domain is
at least semi-trusted - just allow it access to all the xen_version
info.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/include/xsm/dummy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 4536ee5dad..9e6bc0ed12 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -859,6 +859,8 @@ static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
         /* These MUST always be accessible to any guest by default. */
         return xsm_default_action(XSM_HOOK, current->domain, NULL);
     default:
+        if ( is_hardware_domain(current->domain) )
+            return xsm_default_action(XSM_HW_PRIV, current->domain, NULL);
         return xsm_default_action(XSM_PRIV, current->domain, NULL);
     }
 }
-- 
2.48.1


