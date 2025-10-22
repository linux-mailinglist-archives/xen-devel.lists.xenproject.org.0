Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C83BF9F76
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 06:41:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147628.1479850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBQdk-0006tp-DH; Wed, 22 Oct 2025 04:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147628.1479850; Wed, 22 Oct 2025 04:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBQdk-0006rQ-7I; Wed, 22 Oct 2025 04:40:00 +0000
Received: by outflank-mailman (input) for mailman id 1147628;
 Wed, 22 Oct 2025 04:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KROf=47=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vBQdj-0006rK-2g
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 04:39:59 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28aa1c4f-af01-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 06:39:57 +0200 (CEST)
Received: from BL1P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::10)
 by MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 04:39:52 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::ef) by BL1P221CA0031.outlook.office365.com
 (2603:10b6:208:5b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Wed,
 22 Oct 2025 04:39:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 22 Oct 2025 04:39:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Oct
 2025 21:39:50 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Oct
 2025 23:39:49 -0500
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Oct 2025 21:39:49 -0700
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
X-Inumbo-ID: 28aa1c4f-af01-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgmmREDKCNNzM2Cdb2pGeuiXF3HHPJETW8AQKv+paSRl7gSclpLBJ26wYeMn/0/W+TAnsSTKR49hP9njg2udwLJGDYtiJTWRUtb+y4ZEJ8mxMcnWABs5qpME6ww+UZj+d1EbAgtClqScwwNLasaRxt0pB+dQKwLpWT5NW1Ia9qWBRqpULZaL3Qvnxsdzgv6SpBQSLGPPrtqRAKfHkry5QrTDQ4HZEr3yXN0HGUhIn0vVRRSha6Uj5uHIgPMh7RXXNuVxypt8ebL9aDvN28gOzs5DyJBJY83dUYuT9YJpV4k+fO0oH/mT9Sb6DpE8lT9777fLinGu2fvkWQSQ9hebGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gARv+zKauoR8mczy6uZqExysIqSaoputsMuET04rR3s=;
 b=DkBl8bZhvuW7ULh6pr3oPW9OPQ3STLOtQwH7OOm3Q6T4DINr/AuVnKcP+mXTQ+CkvlUHLQZ3wYP/vtRKjuXwwbKkOWeS8SHgFIflg8wKW84vyfInWYG2otjJo9y+eOaMFufzxykc/BoQtqVtfeAkHjCzTSRSsbQlQLpLAXGlna18V7B2Gg+HlSSP8HOCH0rsSvl+TC8g+8ScAlzjWCAz5C1a/Ad9v4hNq6ekTbg54xj9kssRtq8Uk+VvkcdVRfKed2NZgx7AzjY4RyZlsPY2sCl7PIvwEbgLd0v1KrC8H3MNLelKZgKFSayrpbgjDzJoIVQF/uCISxskzTMiCAWHQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gARv+zKauoR8mczy6uZqExysIqSaoputsMuET04rR3s=;
 b=MAghmb9u7+pDC3BUsMeqSUtPu7fK/wkI6N15YgtwoRLqj47narUT17099ChTeCjZMD/8DMS4D1HMgxNPh6anm+bst6VK297xg8ix0fyZppIEd3GzGvpyFh1+3K8KIbEdF79idCSqAyuJNnSRYdk0+49f6ywixF+WAdA0R4+Shhk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <Penny.Zheng@amd.com>
Subject: [PATCH] xen: fix randconfig build problems after introducing SYSCTL
Date: Tue, 21 Oct 2025 21:39:47 -0700
Message-ID: <20251022043947.949583-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|MN0PR12MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e1e29c-63ab-46c3-89f9-08de112509fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j5Xmk440FECVGaDP3eoa2HJqypuMqTTJ3UEuUkXIvzCAEhbsfFPohfOrpWj9?=
 =?us-ascii?Q?2l2AjDbME0GBXdZWFETAkJvGi9oNJO3HEJIApDExr4IbvW7sDLTk5VD/esHs?=
 =?us-ascii?Q?AmUxROqGvMxto6B+9FESa/VO5Z4VEBVwF34qFhRFGHwRrbDUMfgqgXdQ+Quc?=
 =?us-ascii?Q?V8bu8wmSJUSGl63aJenuhijl0S0Re3/O+dcCyToPHLti9ESeQj/eytVXNbir?=
 =?us-ascii?Q?OmybZr5BuWzx1xXYFjlglrhBO8L5/4bv+vmNQRYD0VISndqkLhFwxRrl/LMx?=
 =?us-ascii?Q?u3XcMXtqDT0AVsKW9Mys9ehFwAfJSD0ekvkst1uR12adicBvVwOwMAI3vDBA?=
 =?us-ascii?Q?Q1vELrMGnZnicgei86iSwrEGYzAqNzhffIw1RGCBjKLHGr8wG6DfSB6aLgaa?=
 =?us-ascii?Q?Y3pCsQoqaKn1R1SfNO1oMAB0yYnruWkbOYdN1XI0W8QTK9gScuRjDUqpEkTb?=
 =?us-ascii?Q?4bwS0sE+lLbLUbjx6AnTzymWHqYCYXQshWC0dxne20zPjyVLPXpUdSy6posj?=
 =?us-ascii?Q?2wljZzF7W/jIvXuDJmohnEpN05VbDK90nVWm/jyhstTe81J+nUWKgZ+Gtqc4?=
 =?us-ascii?Q?Wsxh46FPuxSfpWZt3ijHN8ncwxNWirYuMWskttr3f0l5ZO1b/9ltt+mXRnCW?=
 =?us-ascii?Q?X3DQs2v7a/AnS+u84zzsuj4hfgeAs5s4Ig3qJd9OVsnoonzaM49hPRNi92EG?=
 =?us-ascii?Q?zCzmfLE3cGVKjpG6VQ5gb/FXDh1wj7O3NLdcT51J5y8yoCvWS2VEQ74DEirr?=
 =?us-ascii?Q?uztStHMZiUum8SqqLWT/fbDSCIdxXsbEbbB2owaVslRQ7kQyQtoGn1oD9viG?=
 =?us-ascii?Q?JtoR+l5dCeDoqkUbmMvsrqHb2E4dWR3L5Ma9Iueh7S1dhQO33zij9sf62EU1?=
 =?us-ascii?Q?dzxAFGXefQ8PAqdjxwXm1G2jkfTPlhWxd/MTPiww+h0Z4ApWZp/aVreL3qyz?=
 =?us-ascii?Q?Ri0TQywKsf4DOf1hOkJ90F4UkZIgJ8D8CwWGF7Ah/DkKyLK0p+Qw8EfepGOG?=
 =?us-ascii?Q?/2eKymk81YdOY/pTsd5zp3tEw3j2tTV8RnlsShxfINtC5wRf0Hkt1ODaxr0+?=
 =?us-ascii?Q?jsGXKObttdM3n0/X15ZHhlPR6fxHxnHVAvm1yWgaoY18ytb3CjBz9BYGMRVN?=
 =?us-ascii?Q?8yJoyWJuxry9EsZj05bYQ0hPoVniVBrBuagSU4FjR44BA8oScQCBCuEmeaQR?=
 =?us-ascii?Q?4ZwvFbxnghMmLOefAu5Mywf0raOw90l/tc/AY+fiP9Guyx41Ux8HXuj7AR83?=
 =?us-ascii?Q?Dt5461d2rNBhjLkhop1LPTg0NteJWGnIYFJzuV1x0dO2t0nT4rSXLEAiStff?=
 =?us-ascii?Q?8oYEPlIaQzUVwfnKMj0UjyAAMOe7ki0pdq3IixBCYYGs/gE92HYo46gHMaTE?=
 =?us-ascii?Q?9cLXccQTF+nxsT/gnry3BZN/7xnMkXsgCTIXhPfxkcZiShaODDGN/FEbxxlV?=
 =?us-ascii?Q?5L7EoGudYAKsKV1TUVGLXAEKzX6E3XfTD5X8U9ElQqQqI1Js5GHTcLX5ztBo?=
 =?us-ascii?Q?d/aRfquXxqW/A2BIWD/x/GwosiyBIg8KKd89xNtetpANeAm0SELwEQmTCvQK?=
 =?us-ascii?Q?CY/0ohYj1hQh0ObOTVQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 04:39:51.1754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e1e29c-63ab-46c3-89f9-08de112509fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101

Fix a few randconfig build breakages that started appearing after the
SYSCTL patch series.

First, reintroduce depends on !PV_SHIM_EXCLUSIVE for HVM, as it was
before 568f806cba4c.

Also, add depends on !PV_SHIM_EXCLUSIVE for SYSCTL, that way the
behavior goes back to what it was before 34317c508294.

These two changes are individual reverts, going back to the behavior
before SYSCTL was introduced.

Finally, change SHADOW_PAGING so that it depends on !PV_SHIM_EXCLUSIVE.
That is because xen/arch/x86/mm/paging.c:paging_domctl has a dependency
on domctl.c and domctl.c is disabled by PV_SHIM_EXCLUSIVE.
Alternatively, we could add #ifndef CONFIG_PV_SHIM_EXCLUSIVE around
paging_domctl.

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Fixes: 34317c508294 ("xen/sysctl: wrap around sysctl hypercall")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
CC: jbeulich@suse.com
CC: andrew.cooper3@citrix.com
CC: roger.pau@citrix.com
CC: Penny.Zheng@amd.com
---
The new domctl series resolves the !PV_SHIM_EXCLUSIVE dependencies in a
clean and comprehensive way. As an example, the paging_domctl issue is
resolved by patch #3 and #5.
---
 xen/arch/x86/Kconfig     | 3 +--
 xen/arch/x86/hvm/Kconfig | 1 +
 xen/common/Kconfig       | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 3f0f3a0f3a..c2689a3f1c 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -144,8 +144,7 @@ config XEN_IBT
 
 config SHADOW_PAGING
 	bool "Shadow Paging"
-	default !PV_SHIM_EXCLUSIVE
-	depends on PV || HVM
+	depends on (PV || HVM) && !PV_SHIM_EXCLUSIVE
 	help
 
           Shadow paging is a software alternative to hardware paging support
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 5cb9f29042..f10a2b3744 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -1,5 +1,6 @@
 menuconfig HVM
 	bool "HVM support"
+	depends on !PV_SHIM_EXCLUSIVE
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 76f9ce705f..53f681bbb2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -653,6 +653,7 @@ menu "Supported hypercall interfaces"
 
 config SYSCTL
 	bool "Enable sysctl hypercall"
+	depends on !PV_SHIM_EXCLUSIVE
 	default y
 	help
 	  This option shall only be disabled on some dom0less systems, or
-- 
2.25.1


