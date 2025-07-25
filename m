Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0358B127BB
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058726.1426275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKI-0000dx-02; Fri, 25 Jul 2025 23:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058726.1426275; Fri, 25 Jul 2025 23:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKH-0000ae-QQ; Fri, 25 Jul 2025 23:59:45 +0000
Received: by outflank-mailman (input) for mailman id 1058726;
 Fri, 25 Jul 2025 23:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSKG-00072I-O2
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f17a3de-69b3-11f0-a31e-13f23c93f187;
 Sat, 26 Jul 2025 01:59:44 +0200 (CEST)
Received: from SJ0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:a03:2c2::11)
 by CH3PR12MB8482.namprd12.prod.outlook.com (2603:10b6:610:15b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 23:59:36 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::ed) by SJ0PR13CA0036.outlook.office365.com
 (2603:10b6:a03:2c2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.16 via Frontend Transport; Fri,
 25 Jul 2025 23:59:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:32 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:31 -0500
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
X-Inumbo-ID: 6f17a3de-69b3-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doEQl55OZFR8An7/bSDBArHrbuJnyQgFA/miUUs8EEwIEI3TOW7s5UFVpKr8LwVyMPWyFDzQboUL9oyZ4a4weMSlTInIaQoDus/WZnwZv4hOLLolIyQxU/JOfN80kgm5FBkNc9SlhAS6RO4aiAemLakprfHX8CbkweU/e2w3DF7g9BRnURg7Id9MJzaELjJFSeBx9NSXdWRjp35+799HlFbDphs0/Ivp+ne2diKqTYhv2VLcO5D2vyz3BRVA6OP1DF7NAUwYNEsuustB//I7iBYTELgtG2llbia5ZHHKIA5GhDnH6gVK0gROnabUFjIuO/CPqFSkpZqrbRdYMPimHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPrBHukDi4hPz8kOtyqBmvDdX0Dj7DBKmngLvcaAJr0=;
 b=ouRbrGMQACtRXSX832UZmD4kjkaXSuOBlJWrPOPwXfD8B/v/JpMPElkGzqj5sZGeV2mfIGLC/9ZMZapxOn2xLCmHyV/cMjrj6kUUsbl29egXVOd1NUlKJrjj3esbta3f/wOEeEVzXXfkOoDiwyAz1Sv7Nxd/YkE3fh/REHJ7YgrVINdtJl+dJYjggG7EI9MFi2buK3EiT3Xwwg1iJ/9xlKeuIoxylzP3JnE4cOpyiMVH55R3k3At3hnles0Uhm9pjfMkXWk+KGO3ukZRVyk4CRBM3soKkIVBBEAbo16HDQP5gErFWSd47kUm6ZapleGv+eWMNlcwQEUZ+SSD0+KjvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPrBHukDi4hPz8kOtyqBmvDdX0Dj7DBKmngLvcaAJr0=;
 b=HQwY9CoBxu0rhKUllDKKke/0i542fUI40JemTcOx5Z+WHsrWAtDUNBKp7i13R8RQHg6WkHSipFTlFfExKmB9XzZtVXi7r37wxt+Ylnwi8uBwO4typRB24Vxm8wGVMyavjetYWtR2ZR0z+QZX254yGaUmsyBG1ALeVxGBWEi1LVc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 05/11] tools/xenstored: Read event channel from xenstored page
Date: Fri, 25 Jul 2025 19:58:52 -0400
Message-ID: <20250725235858.666813-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|CH3PR12MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f9d68e-8203-446e-1a36-08ddcbd74ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o/aye6EE0ZJcfxoQCc5v1LsLWEaQEaQwQ4LXlN/bhzdRP0Mj/+1/UFER7s7r?=
 =?us-ascii?Q?GACWSZGxZj9+4xbA+sESLcDKGX12sJJuXS+iVZK2u0yWF6fcBjRdkmP2GdW0?=
 =?us-ascii?Q?mD7wSfOpQ5LVAejVnOYdLP25RlVCuGGdP6NuBlB7o3uef8+KsWBCJlIIS9iU?=
 =?us-ascii?Q?WDo/w9YvWfmrcxHCI3BbQvTkv7JBrumzi6Q23dFng+UCoErKTSQwuKCqRyqQ?=
 =?us-ascii?Q?AmgQ+JllOOnqbS55Sfv8ysykh7Ji5trUImhT8WYwipnRf4yvOFai2yJ+o8LQ?=
 =?us-ascii?Q?4p943VaPMRDHXEzl49AuafQMJDm1hi7iok6nn/pgTfc2X+Km5AvPyMORTKjv?=
 =?us-ascii?Q?7c9x0ZkKkPKf5JFtCipArG9a/Ga/rL/HJWm3NgZbZfC0RiCMeOCY+TSB9Zia?=
 =?us-ascii?Q?4wOweJJKeOSIuDc5nk2qQmnZ8vyVZ77kH6RwBQhtNIYCVWC/gGDkY32bzFCB?=
 =?us-ascii?Q?3dOTL/fAd53SqwkGcVBtOwOSrS8gTFGpkbYZcUkcDRYSBY0C9KJUOq7zbxrd?=
 =?us-ascii?Q?lVRRP+wQMRVcBN9eb+xjmlWoK25e/Pp3QHaNAPdVutsg/ldnsiK7/lG54UNA?=
 =?us-ascii?Q?+q6psQABqfz+u6j5/2B9pWGGh3eI41j6dMVhWqJ2hbQ1gp8M1N0i8QJ484+0?=
 =?us-ascii?Q?eDtrOQAKto945AdDjDi1wAUM9q/amCFiH+ChtVlkYyk+Bguq4TEUKaGN3YrA?=
 =?us-ascii?Q?eCp1LGgu4U9o7+ddOWyCqLGaQQdD6x3W+HQA5k6U6uzXwFiwSwaL4smR/L6I?=
 =?us-ascii?Q?U0+ON33gwG/Kenz4Fu8jI/ATY3NRglGqgb9ZlVs24PL1dE8geezOhziME0K7?=
 =?us-ascii?Q?ZR0dWcnVjGXI4/WL/clJV5S84KW2oCz6zN7DazD2nu5OT7tsa46K8z9SOChL?=
 =?us-ascii?Q?rQToRRbmc0AbI+wsgsXh+ll51S2Dl0hyH41uiEEhXIXiZPFKqPv5cc8TH0O3?=
 =?us-ascii?Q?P5lHoV7/FxaLEvT6OB96zRK6tw4F3oEH9++3SbCjjVDuQxIqvLGMc+zEeie/?=
 =?us-ascii?Q?qDA/AdE/CP+ZXllH+QP/morRnqw4FscpvDuwACYevs6vOG0RHaI4MFRI6Dq6?=
 =?us-ascii?Q?4swbweKY31nfJCJtwZhnzxrz8J4VZBxQBM59VfBjQts7ajTb8dVmgcDVC6XE?=
 =?us-ascii?Q?fUJtMR29S0ifMNzK4hIr/2zduie9OfIyTa3pqu+sBuZs5mdRUNPsB0ieIWTW?=
 =?us-ascii?Q?4nRjm15JhSAzaRxDOwZWyzaQTFzpjD2lyaqgvscUDnmm9brIvRsn8PDVpsME?=
 =?us-ascii?Q?baevHWiRYH0iK5FDWchi5FKmlvF8N+kYqiSibOj8uHNzNtUyQoGXqa5wEAoC?=
 =?us-ascii?Q?U39d3NacE+CdU3muZeOE8nfU+SgIiqgYvulWNUTCtOqtmLD6P74YrEJPlIKp?=
 =?us-ascii?Q?SQ8xQpEP28CnbBge/5Kf6oD7GquOUaanwC58OeWfU3UmOYkv/2UmoEh6z6+c?=
 =?us-ascii?Q?a7wqc8UY9z0iUlaSed01O4nZOCVMstM7vGATbv7jfjw+FAswhK0QssQVkMaA?=
 =?us-ascii?Q?m7I7jmEzIoDyh4yd2CK71pg8XQnPaofubW75?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:35.7179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f9d68e-8203-446e-1a36-08ddcbd74ee5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8482

Make introduce_domain() use an event channel from the the xenstore page.
It is only used if non-zero.  Otherwise the passed in event channel port
is used.

The is useful for a xenstored stubdom to configure domains autonomously.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v4:
R-b Juergen

v2:
Remove iface_port variable.
---
 tools/xenstored/domain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index f119d714ac..1241f8c73e 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1024,6 +1024,10 @@ static struct domain *introduce_domain(const void *ctx,
 		interface = map_interface(domid);
 		if (!interface && !restore)
 			return NULL;
+
+		if (interface->evtchn_port)
+			port = interface->evtchn_port;
+
 		if (new_domain(domain, port, restore)) {
 			rc = errno;
 			if (interface)
-- 
2.50.1


