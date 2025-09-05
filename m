Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB51B45F6B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 18:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112197.1460589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuZiY-0001QJ-Jg; Fri, 05 Sep 2025 16:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112197.1460589; Fri, 05 Sep 2025 16:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuZiY-0001NB-F5; Fri, 05 Sep 2025 16:55:18 +0000
Received: by outflank-mailman (input) for mailman id 1112197;
 Fri, 05 Sep 2025 16:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJR0=3Q=amd.com=Soham.Dandapat@srs-se1.protection.inumbo.net>)
 id 1uuZiV-0001N3-VK
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 16:55:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14eb23e2-8a79-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 18:55:10 +0200 (CEST)
Received: from DS7PR03CA0303.namprd03.prod.outlook.com (2603:10b6:8:2b::19) by
 DS2PR12MB9709.namprd12.prod.outlook.com (2603:10b6:8:276::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Fri, 5 Sep 2025 16:55:04 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::e1) by DS7PR03CA0303.outlook.office365.com
 (2603:10b6:8:2b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Fri,
 5 Sep 2025 16:55:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 16:55:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 11:53:17 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 11:53:16 -0500
Received: from drvdevbldsrv2.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 5 Sep 2025 11:53:09 -0500
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
X-Inumbo-ID: 14eb23e2-8a79-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvZRFe36vrYyAPLOeonfYj77oebZ/hCcdMV5taaPptgQdcoR2Ryqh+Y3Wr2M/VjEA8od6QzjrA+b4Ym9KebyPF13gU2ebJFGp/GOPwdMSuLTLkGzmkwjODZSM/6lQ50qMlKtmJKAf2nOQWBhoZlZ25cm+NEk4YYiDqHO/KoKGvkpm/vqgbI8W4BJjHsbMifGoDTMXcpyKxb28jz7SVa1gTpYHoq1IwEYYJ5z0PF8MaWRFkJVSUH2vy3m/RJCTLmjWMniIRsE42U210k16Ark/mSLtPcMzdSl7P9LBvtiHgRig7INMx4fwF6pjRt/BCmF+5Hbje841OPLVH6u7BKTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZ4DTlzlIKd/12RtkgLudAGUzA4uI4t07+Tf0C6Wtno=;
 b=O1sXlC0DxiHgaayd9JFn8pLgoy/t5iThwtuynItmsr0x9szOLZUTFStAt1Hfh7WZxk7ynV1Z49bopX5wiX7uvF5bJQZTCUcTsBOcb7ihQrqjvbiChE9hlCjqSidRh1PwQ91p9qeO7cLMUhco6hr+sdfO9ZEW7SWe/4ucNb3PFcGjWqVYtXYY6/WfOaCxHRV4wFfTPIP4WcA7vczw0SD/5oZYJo0onxBiWr46HFDV4+m2XC+Q/y+Uuxq8PsS4OQm+1eaSjEoAMJfwNSj966EeCAq3VJIbAzIdhB/JY4eTqfwth4QgGrwJp/1AQjtxVZ30pOy3quK0f8OGDxEWeaHvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ4DTlzlIKd/12RtkgLudAGUzA4uI4t07+Tf0C6Wtno=;
 b=ORJh2Xx8egdNWe3z+oIDTRJRCqCoFlA9BFoNft8x2oV41CHcuwVhM+VLzzCqp7ITMOEeF38//jYYfhFnvH+41rIrPe/eAOVzXkrYBSvrhMdJYOjpMjjSw8oJEVj6w+/pelJXiPw7dSzLWpYV7I2Ma91FDgxmuYGQpzhHGZ7xkwk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Soham Dandapat <Soham.Dandapat@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jason.andryuk@amd.com>, Soham Dandapat <Soham.Dandapat@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Soham Dandapat
	<soham.dandapat@amd.com>
Subject: [PATCH] x86/mcheck: allow varying bank counts per CPU
Date: Fri, 5 Sep 2025 22:22:12 +0530
Message-ID: <20250905165212.96843-1-Soham.Dandapat@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DS2PR12MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: ed350cef-1cf9-4239-4c45-08ddec9cf5e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ToCT4UYXx0Vqkx7TanqLWEjKJOZxjYEdpvFZAMNPyJ02VrGpRcSCMqxzM/YQ?=
 =?us-ascii?Q?hoDGlN+eroLFgyC4Py0MK17Y7clU0bPqiN77giRXm6Ovpy77D1ix+cx0u9bh?=
 =?us-ascii?Q?pXKwzDDZYPuLfh80+OtG2CLG3yvaDwsCzoY8RVr1IbMZ0QWLGYSkLvVop2XS?=
 =?us-ascii?Q?efLEjVBFyQp+URveRUWyY3g/O4Clc4x+uUcdtZPGWb/2e9+QAS644pjgeePK?=
 =?us-ascii?Q?fxijk9SHgiTpUP4R2byvs5bxUvjdpcuz2MqFdompJhAcPLV1lXxIFePATZzp?=
 =?us-ascii?Q?XHzvYIRi48g24Tr4gcgfm+mqb6SFUDQ20TBJuSDyHzEAfHbUfPSX3D8Tp1OH?=
 =?us-ascii?Q?uv3Bh1HbdPLE/Ve0XMrfe6i6jKiQt+0Js79+I3x9OVFu5PKnbsvSK8xdyfth?=
 =?us-ascii?Q?OPdLlBRfFs5AiwlRtksmfzobz3wJ/SYbAbC+Vlv0astYGoWlLhEDDKfMt34z?=
 =?us-ascii?Q?Kzj0wECEGe7FNbl7jKEHFf1lULl4Ra5e+g5j1OzHR65BwV7Mwl3eq0iRnQvr?=
 =?us-ascii?Q?gSWPPCcKttQKO37b8BlQMFg5XFv/+u2HYLfweiHGut9Z44sMmhp4WpGDldCN?=
 =?us-ascii?Q?sOxSdo1l31JARHtzu7JRu3BHXGPXbsxeLRCHJzLby9VXO2UANTk6MaaQ66ZJ?=
 =?us-ascii?Q?JwbGYL3wfoFtpEjxnUeNjR/q25JW9w3JYV6NO5cLTLU/R5A9sb3k+YXa18HL?=
 =?us-ascii?Q?Ulyk5a4awoOsJemD9zLXZyoeDDuTZZKQXhpXPE30xGDw7sbnYHhtmpyrpe+U?=
 =?us-ascii?Q?lEvwIwuv+ibM/ltBaWlxVtgy18wF+IoLS9/aAX+H55a+8rA5g/zGJhZ2ltYr?=
 =?us-ascii?Q?nzKJCs/AinJvVWxJXceD+n+Ops6UisbKDMcV2cVqFTQp8gca2VvQiodJXp7J?=
 =?us-ascii?Q?GWa+mHnQlcJBKqBP0/GjNB+FsFz3clEhCquIyqQ7xPfgE+eXa6Z6rz4BkOXn?=
 =?us-ascii?Q?I3PXE5m9m9hNmecw4DyZQeDvsSmWQEZt2nyk80Gn7iWwuLBJm3eEmhoMu6y4?=
 =?us-ascii?Q?BKMA+vBbM4F4iTji37y/RIkolBN8E1/sdnVt+GpLOBZDLE9oexyuzfv4F4cV?=
 =?us-ascii?Q?pKjwDC9H7UX3NU5QVJ7fMsFTch+juEZwdhqrRvrn/HKMNUWXlXj0y+K0HD1B?=
 =?us-ascii?Q?hgzVmOZTCkXxivz9AbCydi5Nj5RuyL/CUJweC9rKr0NsoF33W/UohYymww2U?=
 =?us-ascii?Q?s6544AQWe6ectMQ/iRjMBxcphUs0aQESS2xshkEAGC88TmfA7m1EQucy35y4?=
 =?us-ascii?Q?4yuOlGnIJfoQXA2X3L8Qtu+mjAVwv+Jxp2h5p0yP4HHUSObkgZth2c5Rtl+0?=
 =?us-ascii?Q?gAYhj9DAFO7t0uCBTov21FXlCT8Z10m8L8HNdYENDZ5nWROboaWcOY/lL4Qm?=
 =?us-ascii?Q?/ueDvNSJRwmBqnXHp8FEwogdGugbRs+hxol9/pOU+2kkOWizCiHdc+T00dq0?=
 =?us-ascii?Q?PtJC84nbQTsyhD2/LxBbE9DySfH5HBtuI5KQjdPVh0aOAvBPqpKRJUO+lkvK?=
 =?us-ascii?Q?cvVKdmh9SQBvVEMy6Iol/OErYemNGQ4cIIRW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 16:55:04.0162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed350cef-1cf9-4239-4c45-08ddec9cf5e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9709

In mca_cap_init function,the mcabanks_alloc allocates and
initializes an mca_banks structure for managing MCA banks,
setting up a bank map and storing the specified or default number
of banks.

After this we will call mcabanks_set(i, mca_allbanks);
The mcabanks_set function sets a specific bit in the bank_map of
an mca_banks structure, provided the structure, its bank_map, and
the bit index are valid.

At the end, we will call
mcabanks_free(xchg(&mca_allbanks, all));
This function is thread safe and does below:
   1. Atomically exchanges the value of "mca_allbanks" with "all"
   2. Returns the old value that was previously in "mca_allbanks"
So, when we will call mcabanks_free , that will free the memory.

The problem is that mcabanks_set(i, mca_allbanks) function is updating
mca_allbanks which will be freed via mcabanks_free later. This means
new mca_allbanks instance("all") will never get chance to update
it's bank_map.

Due to this when we will collect log from mcheck_mca_logout function ,
the condition "if ( !mcabanks_test(i, bankmask) )" will always fails
and MCA logs will not be collected for any bank.

The fix is to solve this problem.

Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
Signed-off-by: Soham Dandapat <soham.dandapat@amd.com>
---
 xen/arch/x86/cpu/mcheck/mce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9028ccde54..84238cd0ef 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -663,7 +663,7 @@ static int mca_cap_init(void)
         if ( !all )
             return -ENOMEM;
         for ( i = 0; i < nr; i++ )
-            mcabanks_set(i, mca_allbanks);
+            mcabanks_set(i, all);
         mcabanks_free(xchg(&mca_allbanks, all));
     }
 
-- 
2.17.1


