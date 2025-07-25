Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059CB127BA
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058721.1426261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKC-0000Bq-6T; Fri, 25 Jul 2025 23:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058721.1426261; Fri, 25 Jul 2025 23:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKC-00007Y-2R; Fri, 25 Jul 2025 23:59:40 +0000
Received: by outflank-mailman (input) for mailman id 1058721;
 Fri, 25 Jul 2025 23:59:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSKA-0007YZ-Mk
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:38 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6acea24e-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:37 +0200 (CEST)
Received: from BN7PR06CA0065.namprd06.prod.outlook.com (2603:10b6:408:34::42)
 by SJ2PR12MB9164.namprd12.prod.outlook.com (2603:10b6:a03:556::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 23:59:32 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:408:34:cafe::4b) by BN7PR06CA0065.outlook.office365.com
 (2603:10b6:408:34::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 23:59:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:30 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:30 -0500
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
X-Inumbo-ID: 6acea24e-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bv0ayVK/ZUar1HU36NQNxcJvXXt3neKqnmpI+hE4S407klkjZmzOaiKi8dfoaVB0ky7YkFnHznwitrVE6kBm+nMZsIMQd2jJ6fzJcjNoqp7fbao029j6XALv/kIYiA96EF0oXRoOha0KLW4QLSPfh4Jf17N/jN6oc7AKR8rRmA3y0rxCjeFcm5Dlr+/Awk/+sy8scJ+faD8VNPoos6Ri3NZiJ06TBNp2M9Y7ponHMibMw1OSfelFcPWvKfeLF1+v8w5rKQ4HnqLJJ+0u0q+n8IRSj6iPTjiwJtIHMCPvwjyHzBgYVUddTJH4YEAPHMIrpggBeb0BU8VCzpNvmRAuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsQY3CEOxMXmJwgGeLeDonCu0Zez5UFFVJskUGMmihQ=;
 b=CO2slDsl2xUZKHQlQjQPtIy7y9FwCNklsGOP+dWZMGfC2/mXD5+gPbQB7Ep3T2uhGBxt9Ry2OpmmK7ujV35z21dQsTXzyr1GmRvKHhK9YUjC0wq4oV/utBvtO64hFYmKWJGMO0VjFDUJDFdeZ02jSHSVi2UfIq5Xs8MsZxFLhbdYZniC1L58dhxXMShrtQ0TTKY6adRQImUJyiYRoDvNxOwyKIJpaLjWVzqzDNF3yxykd6sacZI2LbXgeI5Q92pKlMfVGbKeA3fy57r7ba37ZVR66cAGYyyyU2vcID8CQPX0Qv20J0+mSZ+iPEu0iKu29G7pl3XFZIst4ibo85pXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsQY3CEOxMXmJwgGeLeDonCu0Zez5UFFVJskUGMmihQ=;
 b=B0I0ZlhePtKNUmkuUAhI0gqo4LQW9LEfkZvEhh0THyWpIllQcdzhzFKBeMNUEScEVMd1exUesVj0yxcAoKrFM5IPJrpFLtS8HjxuFXF2sEHi2LoMH6uQbCBQkmHmj6zO4AIzOtWgGIkPOSRzwBvO1MCPUsJPQRAx2FiyZx6epxM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v5 04/11] xen/dom0less: store xenstore event channel in page
Date: Fri, 25 Jul 2025 19:58:51 -0400
Message-ID: <20250725235858.666813-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|SJ2PR12MB9164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb305eb-260e-40e4-6d8a-08ddcbd74c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dhX/mVwUleGr7stolJ/AAqeqY8Ah4gvHheL35vMJtcH0oWQo8HOxeua4w1rE?=
 =?us-ascii?Q?3i6/vwxMCrWQRb7UcN0uT7qG4J/LGwg67NUeJAjy6BHNMKDcWIaNxAhaN64/?=
 =?us-ascii?Q?dDly11PQgUBwJB3xCSnMFrOQL2z+LSOB2sfSWlPSrFcgDWKWL5Tx3CFXwQRF?=
 =?us-ascii?Q?dm9hpNvrgeNXMQG+OQsIcb1NO2hcOdPj4XToUM4Mf/gl1fZNzhbq2BeSymyT?=
 =?us-ascii?Q?kfS878hDpJpY2QyF6uM1v1ZiwLmPh5kKg4v4Bnyj5sX064S9Q10sz13CGiFz?=
 =?us-ascii?Q?jkZRENfxFjfyFePEs6l1Xqj0hDlviXDUDa6PnsMpXFOwD5TmpUMqKeE0t0gr?=
 =?us-ascii?Q?jDfCQ3JghT4aFBplHPkHP6lW3wsG8Zy3gA6Y4AL1dLPPEuFgMYz4CWDlXCsA?=
 =?us-ascii?Q?J1BHrxo0Mj2Xqa1tsLrKnUFwiegvsroFXjBphWWTdIcYtNvKH2a17JFpweMF?=
 =?us-ascii?Q?aYcT1F+L/glRnX8vTxtfX1er1JbJkdxe4LA8R3z+XOZiUiW/i0iLhaDvIunZ?=
 =?us-ascii?Q?HS+PZelgtv5FnpR0zRbRK/4xVYzV0KHam1QTp/I2PKWr4INHRmpbMKtdT8NU?=
 =?us-ascii?Q?chEqQzX7OOVPQe/Wt42RtLqX5JiQeYDYBf2e4O0aEgbdLdJo6s/wPxZHw22u?=
 =?us-ascii?Q?smgVAxCGXV9wgTD60xoBOC7Am2YO2hKeL0Xg3jjDoWj7aWgnZ8Wm1Puek14j?=
 =?us-ascii?Q?3fKzyGvRuyqM18zC7jdR0G7jwYts2gLkzxgeLo7Cjhqa/pYa6zyRW2aO7Gv1?=
 =?us-ascii?Q?ILKdIjnN+rQ6ldBKepa1gHTWVcUAgCWFF4MNBmtMZmHLcWKQdrGHdHKVUMSe?=
 =?us-ascii?Q?hsyFlkZmJYmfGjs4e8EeqPRD+nhnFL74UveTJdh3Q6xkeRtUpW+Jorw0IvMm?=
 =?us-ascii?Q?3jyDDuw6azd+CrI0Kwpge9vpYOIZgH7UD7QVlWLuEOsjgi5vmw79IqsuBl1h?=
 =?us-ascii?Q?jsM5WH/d0hL7c0MiMRJKaFiQccm1Y72Gqd7SKg4+nKNnE2RsFnUgO/2TX3nY?=
 =?us-ascii?Q?xxtxu4TC/pj6ZKafaGwuHxvzJA91fq1JXUYKeF7+xU3PzW0PHeheDWr7mcGN?=
 =?us-ascii?Q?MXPwzXlGLiac8mk0VZacET7NTTIh8ETAWxqxTrsr+iKKLKdHks4ukbYc7/Qv?=
 =?us-ascii?Q?dE3MKLEjJsJ0WdoIDdoWm/9Od+VfXUZIS1mt1A3sMvVrpTGKmqmM9eft1uFD?=
 =?us-ascii?Q?JmC78Mt+Rhcys3oDIxnRfDa3kFjLDGSQAE7UAyTp2wE1NAEYxHbTQYgqVL33?=
 =?us-ascii?Q?V6Y1rhbJ9bod47VDqR4m8ApgyH0HvSxysw/t0fkW6ZUbqpQeZvzah9Qe6Y0a?=
 =?us-ascii?Q?qlbJ+B0C8z/RpcY1WhA7zW7nmGkma6sLmqPwU5NfEvbo1sDEXARqCh4xEVTR?=
 =?us-ascii?Q?bSnLpgtTG1FIXOxFpkkZhNsDD5lX+CE/6voXPvKds7Wvp9J3hcEF1OjfX7ay?=
 =?us-ascii?Q?y5HBNqi9Z0NCnDSdUfkKFbcnHHEFmdN6+J9r5rSLBkDCZ5RDwrdoed3Ff39o?=
 =?us-ascii?Q?anXcI8gOFU7NuOz5kcIkbA9ovuHrGWCnPJgK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:31.5635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb305eb-260e-40e4-6d8a-08ddcbd74c5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9164

Write the associated event channel into the xenstore page so xenstored
can read it.  xenstored can map the grant by the reserved grant table
entry, and then read out the event channel and bind it.  This eliminates
the need for an additional mechanism to discover the event channel.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
This is ARM-only for the time being.  A common function to write to
guest physical address will be needed.
---
 xen/common/device-tree/dom0less-build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 6bb038111d..a96089d9bb 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -26,6 +26,7 @@
 #include <public/event_channel.h>
 #include <public/io/xs_wire.h>
 
+#include <asm/guest_access.h>
 #include <asm/setup.h>
 
 #include <xen/static-memory.h>
@@ -120,8 +121,14 @@ static void __init initialize_domU_xenstore(void)
 
         if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
         {
+            evtchn_port_t port = d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN];
+            paddr_t evtchn_gaddr = gfn_to_gaddr(_gfn(gfn)) +
+                offsetof(struct xenstore_domain_interface, evtchn_port);
+
             ASSERT(gfn < UINT32_MAX);
             gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
+            access_guest_memory_by_gpa(d, evtchn_gaddr, &port, sizeof(port),
+                                       true /* is_write */);
         }
     }
 }
-- 
2.50.1


