Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A25A559FC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904248.1312208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJuF-0001Th-EB; Thu, 06 Mar 2025 22:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904248.1312208; Thu, 06 Mar 2025 22:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJuF-0001PN-9T; Thu, 06 Mar 2025 22:41:31 +0000
Received: by outflank-mailman (input) for mailman id 904248;
 Thu, 06 Mar 2025 22:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKI-0000St-4c
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:22 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [2a01:111:f403:240a::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1f812fe-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:17 +0100 (CET)
Received: from IA1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::17)
 by IA0PPF1D04084C7.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bca) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Thu, 6 Mar
 2025 22:04:12 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:461:cafe::a) by IA1P220CA0007.outlook.office365.com
 (2603:10b6:208:461::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:11 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:11 -0600
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
X-Inumbo-ID: f1f812fe-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XgKb1dCYQl/PL4rEeeVbJy3merYIjP8w619jubbZaZ/eFLZBmGLMpCd9tPkveTV+msh6fzQ50v1cmdkkb7AzabPFYq3MxM7jyMJmR1YEIWY+KOOHZgBDrp1Nk5gudgB2cXxW+rMzFsvd+BQTSDtrABFFjzwvpMIxFBBGDXKPgrtR8JsZYoXapnimrD63UefaXsBAOutINh3tz5+FCMTJAA2p+1z4PrO4v9vQfm/09Z4JmDZlg/HbEIkKg19gr0xft3Enoqu7utYV2QpUx38wS1ikgbJLqnMhYbwRNlDgmUmmKdQvfgSQpONSuTkhApNdSqQjdk6QhP4ZOJsRDDOWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPs55QsbN5eLARlGEAoRr/S0ZzRWapeUl7F5PScoPKM=;
 b=pgn+MTHG2aKpEq2Cv4AeffHaqRjEVr0f4uJ7M9dEv68900UUNdeKRzmukCAADcYN9+vVUs26u31SpX/uwOv1SvIzRs03QGyWUsfVnoViA0yzWhqheXD7KGXbQzzZLCDRdagiL2kjAzB1PyReN6K86lEHuoWhBTyyvXEb2hET+xQ7Q4h/z5fDgiYk9uIfBJDO2fv85TtaojKIJZ2cGaKxQUm13dvUs8zAxsGPTb9i+OXQbOrQV6HyRnvy4dg1GE263m7ZroArqN1YcE/wpuAF9bFtQvadpV7DHw1b1QyT/cGlk1EyQmm47kRt96qDI5DAWLLZS7d4TUJPnIlfnioHsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPs55QsbN5eLARlGEAoRr/S0ZzRWapeUl7F5PScoPKM=;
 b=y6aUXXQfUY5YbR2S0/RqMfaS1afTwPZ2HuBsAna+trEQXBJ2eCdAHz3uPWs7jZ/ZpjjX8VDUJeFLZ//PP772X8uUGgILr2tFEF0bp/L9vsB2ZJK6OUr24/SbJpMcZRLu7cmnmpaqoK26Ilij017rnzdpKpSPKtubsHaSttUyi88=
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
Subject: [PATCH 20/23] xsm/silo: Support hwdom/control domains
Date: Thu, 6 Mar 2025 17:03:40 -0500
Message-ID: <20250306220343.203047-21-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|IA0PPF1D04084C7:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c818c7f-bee5-4c31-ad47-08dd5cfad3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sybdcg/DlhAfGXP0hsrikDOHaUMXVwN8ZeM2YyfthrLlzd8LjsMdAISF6QNu?=
 =?us-ascii?Q?67bsp7yoxjYKobqAZBoEs5bHQv6ByzFrD8m4KdJZrAov9tnQTlNqGxuBQOev?=
 =?us-ascii?Q?L7NAiYa17tBLpkFu2FnMZrJGkCjfsDywVuumB52Wthhmnnh4fiVqgtOjPTxA?=
 =?us-ascii?Q?A/pjw6svLzPB+xW6eH7H+1jCPGK+AxA4foJkmWpEk34hocmU+Pta0pYZKwjY?=
 =?us-ascii?Q?yqoEbRerkbvgISYX2OltBdR76E6J6T6bUcx8lTglaN+rhQGSm/CZhFUTyJWO?=
 =?us-ascii?Q?YGjkRURno+zIDITigqpJ3HOYqTT8562dHRcJn13bwAtSFDpOqjf6exso0ghs?=
 =?us-ascii?Q?5lRG/Q18tOXwuYUMeOSSsjIWRmlRN4wlycAF3k+nWvUO9qmUY8ocwAw/I+LZ?=
 =?us-ascii?Q?16sWN+q8B0k5l4o4D1FRRUACZWlOoI9D/60mjalc9KQFFRdltu++A8avN33J?=
 =?us-ascii?Q?OA4/QFKzFpPM/fvGc1FKl661IQdeH+zVlHlF22X7eUhSH0b2vHv0lgOpCCzL?=
 =?us-ascii?Q?Kzo1DLTOQV2ojyVotzv3+S+Sy/k/UTa2LIDPYN//5Gpo0+dUTMYrFehtL6i8?=
 =?us-ascii?Q?HSZDThyIUDgU8PYilqf4xbSt6CecX9WOTjXLezOBCVapcKmzB4cB288aoHRA?=
 =?us-ascii?Q?Bf3e2SrPbaUKnCpiwpuGPb6g9X/CiLgGukJRziHouWiZlRsfNIpizEWqlQmF?=
 =?us-ascii?Q?yGB9WbIHvduR5Mb+x6WF8sIpyTwkUoq9pPGxRmzy9PpDCnVrFuBr33hVQy5J?=
 =?us-ascii?Q?/ID7MQKrqbPTYWIKVCg+C5QWjOulQFlUoKonoUqKmwno4KDscrhio5+iH4UP?=
 =?us-ascii?Q?KTNLH38cyS2l5XyTkZwx7xue69g7iaCAchGJgMe8Npk1FQc7UHFsy7nXhhOo?=
 =?us-ascii?Q?BPJJNYo+2gFEX+m2mC8xhUZ5uc15G4yuWXd4zCFdKWt85Buh7BKzCmNgO3mt?=
 =?us-ascii?Q?M+I9CTAb3bc1u/PswxUeOtDQSJ40sJY1MeIPklkmD5YPAfd86uU3qFuU6C6J?=
 =?us-ascii?Q?PnP1mmqIVCKvuDZAHrYt9y185OYWZe9Bsi9b7HUsrb0CDNtzzoXtG5S0A+gb?=
 =?us-ascii?Q?cXRCJ/bC7jbt7YBsBY9gbJU0IDXvvqY9F7mIGriCe5ognGfAl1nRVAjPlaDs?=
 =?us-ascii?Q?LOaZ9XWEAW0POg3BypWuP8pjBsWBX1VDxu0puxDEQ9by4pOK1s4hiZUgQt+j?=
 =?us-ascii?Q?78n6RLIcuWs+EOqDRthKzasAzXbE5azXVk9saUwU1znVNehlNoQdrHbe0z56?=
 =?us-ascii?Q?gMLrqEdNVb/5KtZGwL0yUY3PyGnLou1QWOblVmWRliKHM6NwsHbRHa2KN89U?=
 =?us-ascii?Q?65+zSvcK91HLYo6uifR5tI3rW+YmnOLrO3qo/ya5DXRNm777McFfnSZqzh8m?=
 =?us-ascii?Q?jk2NDXrw5shh15G1F2C700UBgtU1qNRUKdvFsRdwb7pljtNklieag5l7dECF?=
 =?us-ascii?Q?CM6B6TBlTvQ7WO4XXFuEQK7Ts9y3NOK9KxdUFkO7LE3hF8f2YXMtFdGjZujL?=
 =?us-ascii?Q?DK4U3wAk+8ux/RM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:12.3092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c818c7f-bee5-4c31-ad47-08dd5cfad3ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF1D04084C7

The is_control_domain() check is not sufficient for a split
hardware/control domain.  Add is_priv_domain() to support allowing for
either control or hardware.

Without this, a xenstore/hardware domain is unable to map a domU's
grants.

This silo check is for grants, events and argo.  The dummy policy
handles other calls, so hardware is prevented from foreign mapping
control's memory with that.

This would need to be expanded for a standalone Xenstore domain.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/xsm/silo.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index b89b364287..d5e1a554ea 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -20,6 +20,11 @@
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
+static always_inline bool is_priv_domain(const struct domain *d)
+{
+    return is_control_domain(d) || is_hardware_domain(d);
+}
+
 /*
  * Check if inter-domain communication is allowed.
  * Return true when pass check.
@@ -29,8 +34,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
 {
     const struct domain *currd = current->domain;
 
-    return (is_control_domain(currd) || is_control_domain(ldom) ||
-            is_control_domain(rdom) || ldom == rdom);
+    return (is_priv_domain(currd) || is_priv_domain(ldom) ||
+            is_priv_domain(rdom) || ldom == rdom);
 }
 
 static int cf_check silo_evtchn_unbound(
-- 
2.48.1


