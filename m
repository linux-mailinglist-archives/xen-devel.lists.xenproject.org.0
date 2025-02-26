Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6B9A46C10
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 21:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897224.1305942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnNj7-0007jm-CP; Wed, 26 Feb 2025 20:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897224.1305942; Wed, 26 Feb 2025 20:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnNj7-0007cg-94; Wed, 26 Feb 2025 20:09:53 +0000
Received: by outflank-mailman (input) for mailman id 897224;
 Wed, 26 Feb 2025 20:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drmc=VR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tnNj5-0007N7-FY
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 20:09:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2416::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a06917c5-f47d-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 21:09:48 +0100 (CET)
Received: from BL6PEPF00013E04.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:19) by SA1PR12MB7199.namprd12.prod.outlook.com
 (2603:10b6:806:2bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Wed, 26 Feb
 2025 20:09:43 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2a01:111:f403:c803::8) by BL6PEPF00013E04.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Wed,
 26 Feb 2025 20:09:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.0 via Frontend Transport; Wed, 26 Feb 2025 20:09:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 14:09:42 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 26 Feb 2025 14:09:42 -0600
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
X-Inumbo-ID: a06917c5-f47d-11ef-9897-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joteRQjOz7O7UqJUO4YBzIQWz5+HRdjwoncGr9gCkuPyZd1s41SLEtN8IPMe2M7nU3I8YpusAO38lCeh9PtL0hOjsxTD3N8Bs2/mXY9uBLdX4Sf2BQOgoXUT3CI3S7SnNicw8GfhZVmzUefmidazlYgqpsPFGiTunzqaQ8TsXxQgNhrgrpbJblFxAa1zPi2AkpwC9DErTxAK+DhEweuazjfpNVoV1YwGRDoUFZRpYlR566K15/bPCYGpb4WKSRq5qXEb/4aRMNd0/JrWV4cBbq6ZKnv1bPId/0Bgj6Zk0le/RsC4X1X01MLolVe+8Spv+eaAH1dThilTYqBvbyMTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1PQd4NLZQqhDaO6y0X845NeNwbBnbu7oaTg1UI0OYg=;
 b=XZD04JznFOx4a+TctkmpwlsC8q9BxZkcbLhUl3/rJnCKqLUbHIgz7sYIKqzfRK4OAipPCakknHbrPd6xnR6djNlASar0QN6n5nQOHROsEv9tAvROWYgi8QM+dUDDd+QUlKiwaAe8LokgKkBydNNG4n3Af8Y8e8vS/dp+t/luyd893lsUVRXX9G6IMLDDL+KPCPjGrdRyRqasq1Zhv7CNaTu3fu5ELIKv/gWwV6JY/Um4XxXrikHVbteQJfSyv2ImdvPLnEKZxEB13GfPHfHPrDslTVy149lc1b0VIIceguaCp/pRXkCJhPRTcyRiFxF/qCpy1onCddTDj67Jc8kg+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1PQd4NLZQqhDaO6y0X845NeNwbBnbu7oaTg1UI0OYg=;
 b=UjZ7WRtT8mdeThUXmRR4+GJL4rcaRR679Qsjs4vCpaLfTTkB/G8XYSxfyY39ESt3PMjfJmC3Xl9duvcdHNnBiZCjltz92Md0/CzzuSvnJQGKrmG6ZbvnxJmGGLen/Gl6u9qUsWgkVE1zsLXPRXDnbYFVA57au4pWL88n/fIDI5A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] tools/ctrl: Silence missing GSI in xc_pcidev_get_gsi()
Date: Wed, 26 Feb 2025 15:10:21 -0500
Message-ID: <20250226201022.42447-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226201022.42447-1-jason.andryuk@amd.com>
References: <20250226201022.42447-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SA1PR12MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f3f3ed-bdab-43cb-e978-08dd56a18240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nqaB8bFQeDrH19wXTZaLZK2CkzMQgjKl3MNck1BdmEh5lcRAnBJ68zlOPG9p?=
 =?us-ascii?Q?N0y58EDNwTE0Or/Ml2EBPoUclBPHWNipqn+iOuLO4kk+LrZqBS079Mm7BZf1?=
 =?us-ascii?Q?EN3uassARooYo54VdjcKchqGQFjzks3U/06ELZlBeDGSKRBoOQajd0jkle6c?=
 =?us-ascii?Q?e3QHvQzWPnPy0XWoqVs85SH4WoIMF0qfUd0u+xmazvaBp6QQB/vmU6p7sqUQ?=
 =?us-ascii?Q?XtjEZHnMYv5tqRYrOU3O1zB3BcSfZ9IJK//43kOqU+y9Tw5CnncqahWeg4Gc?=
 =?us-ascii?Q?olIJOMsgWPYImA9cjr9mr272+5JSeicqAwwT9al9waEPYFZfewquIgB3GFUS?=
 =?us-ascii?Q?mw4PpB0SX0G7DYQrB38mYqvP3x9WPTLUtOok/RPiVc10G6uVahfr+mO4wrC+?=
 =?us-ascii?Q?z8WzOfrQRUtQSPbExB0bTmA1W+00ZmuJump7PQ//10sqmOGkpUsBvGR8nYSX?=
 =?us-ascii?Q?Yia3dUqTAVNnt7nXtSu2Dr1fRDYTXV2dGYPII05pvviypOXzWl4r/tgrZ9dF?=
 =?us-ascii?Q?yltnVNur3cMqp9mm5M37U1kTNCUqz2rWzR0+1ZZlCTi+rDHOxZcI5l2Oidp5?=
 =?us-ascii?Q?JduX8masS47BUfoSFNp1nOHt0GDBMebNxGcQsIyVvexezKruPKn89Tw3C8Fz?=
 =?us-ascii?Q?vcKaBvvbRiT8W5YLDoUluhgJZlrR8CP0+e3E8EnhR2sjpy+YVmZhElrUDVcd?=
 =?us-ascii?Q?7OWZmgwcQ/JN6RT6xg0L/koA0rfa6K6Gy+480s/7s1iqIt5337Erb9w3/psG?=
 =?us-ascii?Q?JYxTOG0eWT5sx/BDLFJQhs1G4led2XbsCoaAnGONJFy5ONn+7kpqQeEGh3Qn?=
 =?us-ascii?Q?+925Xg6tGWC60iEIo3Y2dES0vtJ5gKE3sOXl4FNWTiQ3c6DLk+amAyuwTo9A?=
 =?us-ascii?Q?8ZSUJ7bVEDXlqZRJBRJ9phaTTNSGOmtvJP0VoOyTwr653sNzl4COI9l7H8mk?=
 =?us-ascii?Q?Pbl4lxymNTF3epBS/SZL7FK5FH8KJWBNRsuRW/IftxA7xczhTRp5pcsytlzZ?=
 =?us-ascii?Q?6cozPftfrw2dmWbsyrDiGjWowY2XGPql2aGe69IahKVWUOfWFJaIIw3hNOSK?=
 =?us-ascii?Q?gGDISon1z1NAyEvIEnGtH891vlvDB3a+J9tSnuG7jQblFAxnUt56tep9/BHw?=
 =?us-ascii?Q?h1s0AYCboNTQcv+Lw+BomWQaV1+Y5NzaB7ZYl7uojYSEpCk+VWfaBD11zZmN?=
 =?us-ascii?Q?N3yy7Q5zbYGvEnZzdgkhI3dVA4bhFS7GvrchOQ/hM55idkgN4tecZjE145xj?=
 =?us-ascii?Q?nUId3Boo+bnufjApmzOWK3moQ5pMKLq4uEHe0BsK/rbZ8AyskHir5jKf8kWq?=
 =?us-ascii?Q?Qn0kxURyQfPxVrBfbf43uy4zNlHqva8Q2Y6EFRC2YcHF3t2vbKjbIpQQWEEa?=
 =?us-ascii?Q?6kSpvlqGYIurqyCNRUim6kqjcXvmvCuoegI6ZD6BHZpG/XvO4PHpTb/Hl/nZ?=
 =?us-ascii?Q?m3/U95o0D5B+0kZLM7TvcGwKCSRQZhfCPYW8BqCqTyyKmUaOHifzDuAGAGDs?=
 =?us-ascii?Q?nYuNKdR96SDqzQs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 20:09:43.0869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f3f3ed-bdab-43cb-e978-08dd56a18240
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7199

It is valid for a PCI device to not have a legacy IRQ.  In that case, do
not print an error to keep the lgs clean.

This relies on pciback being updated to return -ENOENT for a missing
GSI.

Fixes: b93e5981d258 ("tools: Add new function to get gsi from dev")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/libs/ctrl/xc_linux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
index 92591e49a1..c18f09392f 100644
--- a/tools/libs/ctrl/xc_linux.c
+++ b/tools/libs/ctrl/xc_linux.c
@@ -78,7 +78,8 @@ int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
                 IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
 
     if (ret < 0) {
-        PERROR("Failed to get gsi from dev");
+        if (errno != ENOENT)
+            PERROR("Failed to get gsi from dev");
     } else {
         ret = dev_gsi.gsi;
     }
-- 
2.34.1


