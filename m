Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A1B07F81
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045781.1416032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aD-0000Og-SF; Wed, 16 Jul 2025 21:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045781.1416032; Wed, 16 Jul 2025 21:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aD-0000Hm-L1; Wed, 16 Jul 2025 21:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1045781;
 Wed, 16 Jul 2025 21:22:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aB-0007F7-TM
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:31 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2009::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fac03e20-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:30 +0200 (CEST)
Received: from BN9PR03CA0783.namprd03.prod.outlook.com (2603:10b6:408:13f::8)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Wed, 16 Jul
 2025 21:22:25 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::3f) by BN9PR03CA0783.outlook.office365.com
 (2603:10b6:408:13f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:12 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:12 -0500
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
X-Inumbo-ID: fac03e20-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXoWBJ2hjuqp+s+DBQGhj8e0OUHcc+dFINaaC6zreT10nbbO5z/8Ke4ZWbP3CBhx4szQOsKqkKp3uvqUMeQcOIM4CitrEXFk6eZ/1QBbTiYydp28JtIiB340BsL5N3Daowjb0k4f+5ahkstZYallIApcye5q2nOw/D30SyvcKFBFPkVZda3CBIJtK8lia1rZO+UUrZEu3N8dZjcssCIpPwBZ3Mag3FNVrqkf5Vk7y4NPWx+j4ui+MWUzDUVU0c5MZSuDcbts1glF/gPCfiatbsPaIG0f85+bGZ1mPGneQ2Ip1qtWyeI2fhro0nEDx4xqwKm2mNAeXkB+f+L8pzmbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC/j65QIU+fP7oEUp28jilWRcpySatiEoKnXk/jfLvM=;
 b=VU3esb5b787D39sx/sbCUuCCs3wcjdRy8YCRuDoJKjOrO9HmkqKY4HH6CIFNy+vxZPv2IbhpZKDBtw86F2bm5ePjIxtYvI8mdhJLoJqSy9KOqNcXM9fiOfiWbr0MEqjoxZkUqjFCNs1ZJHir/0+pel8XwbvDkSQqqkV9updmUNbe1Hack52YXBB9E4uqtfvwW5BsBAggxBH/VJc87jySDLdWSaJwEXymgTHU+8Nrv/oBhGVWolN2We1d9HP1nxzME6+UxU7oeM8KH98tBlf0qYRrk+1pTlQqK3AYjQRyOsrh0TffZi7YIh6V7e2aLw8sSJC1VNYUpmbA5MpkzRkdeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC/j65QIU+fP7oEUp28jilWRcpySatiEoKnXk/jfLvM=;
 b=m6d6rg1oae4BlOn/yhc/SnwI8zagbtfRjH9loDmmUTBtsMpXRo7pSh0b6hd4ZPQaJM/AY2na2hnGNy0DDOm0FW6oqmimbN1gT2lEPUHWLSUADOZKHxECll940RNO1PL2tnC2GIIQKMNY65mBZzMAnI8Y90PiFMRjrzux3pvLfc8=
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
Subject: [PATCH v2 06/17] xen/xsm: Expand XSM_XS_PRIV for untargetable domains
Date: Wed, 16 Jul 2025 17:14:53 -0400
Message-ID: <20250716211504.291104-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b34d842-352b-4767-a3ac-08ddc4aedbcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7hJ/Nj7EiJmYAyrBzQtUiPKygknnSKXtYXUma3VK/Lo4Gfj5u1/5WTN3PN4P?=
 =?us-ascii?Q?CND4tTXCQohM9i9bvFQ9ZV///D6HzOfoCWCsClMFb8LX5NgmPCoVMelErp9i?=
 =?us-ascii?Q?clQ68NJyRYS1lwRl5Zx9u04jdD4x33FR2NrUTBAZAidi5ewl25gwWdCROamo?=
 =?us-ascii?Q?acupYNkW4O8MuiR9a7zFWaB9BlcmdpYAHuqslyZWn2Sj06eboqlMZx2K2wF8?=
 =?us-ascii?Q?wIesgtzVyvme0g3uJwp7MzopQjfeyk5G+5XIu/s/84hXN8KW5itaJPIRUCay?=
 =?us-ascii?Q?VK8/9IT2aj6d4PTn9TcRXyddt2RmNH3Eggde2EGfaRTyAMUPecyQJlqLfjJ+?=
 =?us-ascii?Q?vsjbqEjvJ3Ezli5NoWT1eZGqmt9hMCIxV+2K1DCpo+5ukkly5wF4Kc4G6Ctj?=
 =?us-ascii?Q?ig6pM2YXJtjcuWTRA1sPaS818kj9ImQiw4mb4C0ZM95BtIQfDhwdC+CWmHjZ?=
 =?us-ascii?Q?u+Uc2qpPiEPbICZSad5CPodlFbdQrTGaXui81r8aIngUCdlMXXO3JH89MJH2?=
 =?us-ascii?Q?xWRyn5PLm9NJjzYTDcOvjpGt/rb9rqVNtcY91Yf2JBSKRT0ONprUAdShHGuO?=
 =?us-ascii?Q?tjCiNgS/ImCv4Ko5A/xES28yZ4AELd0wvN/OrNS/PcDh/Afa2JyEJugJwtIN?=
 =?us-ascii?Q?7YdrJWUQcFi43HXkWkrGyYrNx/HHQrT+feli1EmFNKceevIcciC4Z272RC5u?=
 =?us-ascii?Q?z5hxSV+ZRgrUFvSMcIQhNVxqPIxzagWMu7YjQX61BEmxzb4O+pkqiYkjcjLO?=
 =?us-ascii?Q?gXELwheW1ZtUbFMwFHn8sN5D7tpMs+N7QPzoeDJ3+/4gOGc5lWkHxRTghd9H?=
 =?us-ascii?Q?0ky2slKDiG+W9MXR/QhBx1GsxL1QBdbOlv5uPdff7w4FfeDtLS8AQOFbCEGP?=
 =?us-ascii?Q?U38MbysH5rOybIS+bV0BjoHoO+wyU05y4HPZdAFTJ2bEi3OV+5EmfnTtf5E0?=
 =?us-ascii?Q?C9oBEBQ7c57O2LfHScN/syT6pfRqyt6JYghvXx6vdYSrKJtxSx6GPjMb7Blp?=
 =?us-ascii?Q?NMQrAxePfjrucyMdhhvsd3EgfeL6N45wvbteYg9A4uTClp/E02Z5EIyKM1lv?=
 =?us-ascii?Q?FkE/e32VOzMuQSEHMAXMOt42MvwQbkdtt45v74gTpa9DwUg5mXl5loY3lYvE?=
 =?us-ascii?Q?KPWGBEyKeZMXf98gvMh/y8SKpp+5QLjEMLiQij9jHsri9GHpYPbVzhYDdn3d?=
 =?us-ascii?Q?iGQvEnZRwbrILt4mXDsQnwNtnZEaSeqBovAr1M9s2fwjLWFrdJ/ikJbigtQE?=
 =?us-ascii?Q?WGgoH5PpXNpHvi0N6ww0aA2ar7OoaVX0Hg3mdVJdpuZNHlpmYQTqAhwZ+GFt?=
 =?us-ascii?Q?27VPuYa1WcV3bIuY23W7AA+rHtoPW98Okoe5gw2r9U9mbf9PRpql2+sgpO64?=
 =?us-ascii?Q?F9ma/KmL1xj8g6wfasQVqJnDnUzNluocG61Lbf1MEPwMEn2yqeOfH3TIA2ND?=
 =?us-ascii?Q?z8QiLzoUbWtAjT28I6xd96SyNmyAH3QMtIAiHoHUBC9Up7ik2taLGLihC1CJ?=
 =?us-ascii?Q?PQCi2BpNKizH4x7BOuzNV2Yg0Uf2x8mRUK72?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:24.7023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b34d842-352b-4767-a3ac-08ddc4aedbcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428

Untargetable domains are currently hidden from the control domain -
e.g. xl list will not show them.  getdomaininfo fails on the
!is_hypercall_target() check in XSM_TARGET.  Add control domain to the
XSM_XS_PRIV check so it can pass.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/include/xsm/dummy.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index f2205575ed..4d7b1d61eb 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -87,7 +87,8 @@ static always_inline int xsm_default_action(
         fallthrough;
     case XSM_XS_PRIV:
         if ( action == XSM_XS_PRIV &&
-             evaluate_nospec(is_xenstore_domain(src)) )
+             (evaluate_nospec(is_xenstore_domain(src)) ||
+              is_control_domain(src)) )
             return 0;
         fallthrough;
     case XSM_DM_PRIV:
-- 
2.50.0


