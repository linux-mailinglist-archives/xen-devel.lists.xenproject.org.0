Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB089A71049
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927067.1329905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJow-00067V-8a; Wed, 26 Mar 2025 06:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927067.1329905; Wed, 26 Mar 2025 06:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJow-000611-0c; Wed, 26 Mar 2025 06:00:58 +0000
Received: by outflank-mailman (input) for mailman id 927067;
 Wed, 26 Mar 2025 06:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJiE-00083W-DZ
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:54:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2415::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b716e1bf-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:54:00 +0100 (CET)
Received: from SJ0PR03CA0270.namprd03.prod.outlook.com (2603:10b6:a03:3a0::35)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:53:57 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::e0) by SJ0PR03CA0270.outlook.office365.com
 (2603:10b6:a03:3a0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:53:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:56 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:50 -0500
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
X-Inumbo-ID: b716e1bf-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPJahobC2csRSvfm2TvYuevpMHlIq1FgOIocvADmpJkjHpvluGzw93nLPsk9bMJ1LH5aPThZAJQ/iG9oUugn8GetINwCg75itCZ5Hiyg6ce7u7IB+jYvzjCtfbZdHhP2RI3R56dTfVZ8ZDZ1GRiqFewCbE8MPgMFxZtjkYl5vLUUGliF8A+DQs5ndrR/6YLLWqjmEddJ+yZv0YsgCjEfABD0UY+AFby7kS8PHHaW3hWEowx5HvaTkT2Eev406lbV5zLmj0WIWJM2uI3SyLo1t3SS+RAnQ0NIrJloYqx7LUlEhdQfxPH0f8gN32SUOUSxlIeTjbDbcNhNUNqZhT3TBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9945qxdUn2PylyjdcYgad8LTv9PlGRGmYGGpFMk/+Dg=;
 b=L8OqcEINXSrML0IpcjsDUEk3TWWXLsvYvPG2cTyovOtf4wZNi/6HrzVwEurEN8kb8N8NHJNeUBu6sOJp9IO9RgifeRUeAiaWSqdmE7z0E8FECYFIaxJA6uIWdiZ4Mn7HijY+bs2RWqKos1BZF2+YKBdFy2mo2qUWqja5ZKyU6HDFf+kyqWM5dXhGOTwTOox5Z8HmssgGxQihLP0Sle1MzrPYkLdkkI3rSMVAFVat9oG96KDTMPNVTh8h3zwNTC2BGsTM2rDMPWQaFu+acngYY7qtripl0Wg1Vaa7NtO3u2MX4+WwIWyTq+zLu+54+S2FcZH9AZrIQ0rRn/cuQuH13A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9945qxdUn2PylyjdcYgad8LTv9PlGRGmYGGpFMk/+Dg=;
 b=Jck5CPST3xaMHKh03U0NY59T0FwzCgMfCjoBXbB2pJ2lHI+dD2bXDa4ZTZVtAxoX7JMCGlqjG7ipwGg0ov1yVCl/k3mKN0bPmK8mY7bCUwm8q7NUcFbGD2y26TMRpBhmi8RgAsAE91CDYjk48k35/YKUvMSk2WX+uMN7+qnZxjg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v2 12/19] xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
Date: Wed, 26 Mar 2025 13:50:46 +0800
Message-ID: <20250326055053.3313146-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 967fb730-f830-43a6-2c90-08dd6c2a9912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Txg2Dslz7AulPh0C1NM0TE4qmsBcvzqQnJiqcDUnKD6NvTFK6R4XngR+MjU2?=
 =?us-ascii?Q?wO6hvCdul/G7AdtEHtUwBMWaHArLVH7YdYZ/g1fEbI8irm2TK7b3DA1PD1OX?=
 =?us-ascii?Q?gNUGl0Hls8eQgf2mIYKja3B56GdFuM4ZObUpQqjIt5gBxQBavJuoNhQKuPjV?=
 =?us-ascii?Q?8JfHRD/Rxz9xRZyJf0vQt6GZhGaAhRIMvKd67W7WBbwbG93uVkz9+qn2gBmo?=
 =?us-ascii?Q?fBqP6xkSCDQmn9/pLtA3vxnDyukkECl2FhRGKxkMR/xa7UdkOT+UWOtoSaFS?=
 =?us-ascii?Q?CeYTNXiPL+nI92fHREWHG0xJr78UPZwDTx9WokTGq5x5qf3FlVznjV0V91wo?=
 =?us-ascii?Q?sEkBJBbeT9aLwdFriE2LWs0N37iYzR5HQ1W5d6PYOrT4YQwXgrRcX8Hxdfwn?=
 =?us-ascii?Q?kQHe4ebZEHz+u+IgWPpJYApjz8WKh/PkP28DR8nWTG4nJqkoDZHHifE/HNgU?=
 =?us-ascii?Q?ZfkqWcxU5FdCrnoacMum/wNSaq5nFshQR8Sxv5IhXmhKHfjdZxPZJHmRDZsu?=
 =?us-ascii?Q?VU9k4RWEbbNj7xG2XWhcXR3aaHX1qQ1Td2Fv/s6AkiXAID+Vy6XCQDFh1Djl?=
 =?us-ascii?Q?H776ZAitxm9FZp8iGPQoY/4md7QEVEFOw8Wh//Mdd37U8Bi2vK+66Uu9+k/F?=
 =?us-ascii?Q?TpH5QkrXxaYWx13o8PzvloEhADUn497ru+T7HBORGsV8qjwJaWdDSrbO+7FW?=
 =?us-ascii?Q?/FsCTSQQJPW2BnXGjEcrhBr5p0RCFpTkVSVqoklVZzSx9S/+ouFN0EOjvDIj?=
 =?us-ascii?Q?RbqmZWVyteBVjyGW3VUTZFsOiBKetugzHflVewjP4Rf43AW/gCfAO8DcYLEq?=
 =?us-ascii?Q?P1V93Xz3q89Zl5oC80K3LnPXjUkM4sznjS45LQvZtoIoErX3609tOb9V0NNo?=
 =?us-ascii?Q?NwcYqR6e6byFjmSXDfjOJuatOBEmXCOhgNhdU67prDgCWtox6vTfJXEi7y+3?=
 =?us-ascii?Q?hbCGu+bqCDgAvIEcYP6mXCy8HumwiF1O6O6R3l3lTPra44klx9AfD329NVH+?=
 =?us-ascii?Q?qtjlJkopRQb1xOUzLQf1KDDUEHz7/9iPbpJoDaYZ6hBzSuRoFjaxeH30Q+Sv?=
 =?us-ascii?Q?y56sJp/j56Fhd/T4WvwAGKOT/TfgD17WvU1OUFyrhsr1vRLSLJ5FeSEw1hu8?=
 =?us-ascii?Q?BIAsrzc55Bh6dzGFeswrA5ZCyPqnS+0WqQmDA1acKI9t3lyDElE6ToxHLAx6?=
 =?us-ascii?Q?0KCTNIeW4nu48O1YJxzZ4NDV3FkqbqjUz7A268v5pfHGlojeZfhBZXImKm9f?=
 =?us-ascii?Q?BTGHGIkqSUe0o2GKr/2ddXt8BsUcvqaWOp9AmbPPvyFrzc81UbF2jvhpCQKP?=
 =?us-ascii?Q?QZXH5ywjluCMRQJRo5A/bIZeybWhSd5ij4smO3fUAtLbcGuYvkaABkc8XJcq?=
 =?us-ascii?Q?E/mpBl70KzhCl9UtYup88qa5def3NIpTFnh2PdOi8oaPTf36bm6aWcz9Eqbp?=
 =?us-ascii?Q?oc9RBpvtNApuBrICPaQaDlYW/gPf0pHzAg6wtICuh4P6SIP7WJ5M3YOA3y10?=
 =?us-ascii?Q?u9w7sITwzSz6G7M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:56.7603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 967fb730-f830-43a6-2c90-08dd6c2a9912
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208

Function cpupool_do_sysctl is designed for doing cpupool related sysctl
operations, and shall be wrapped.

The following static functions are only called by cpupool_do_sysctl(), then
shall be wrapped too:
- cpupool_get_next_by_id
- cpupool_destroy
- cpupool_unassign_cpu_helper
- cpupool_unassign_cpu

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
 xen/common/sched/cpupool.c | 8 ++++++++
 xen/common/sysctl.c        | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 3d02c7b706..f5459c2779 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -241,10 +241,12 @@ struct cpupool *cpupool_get_by_id(unsigned int poolid)
     return __cpupool_get_by_id(poolid, true);
 }
 
+#ifdef CONFIG_SYSCTL
 static struct cpupool *cpupool_get_next_by_id(unsigned int poolid)
 {
     return __cpupool_get_by_id(poolid, false);
 }
+#endif /* CONFIG_SYSCTL */
 
 void cpupool_put(struct cpupool *pool)
 {
@@ -352,6 +354,7 @@ static struct cpupool *cpupool_create(unsigned int poolid,
 
     return ERR_PTR(ret);
 }
+#ifdef CONFIG_SYSCTL
 /*
  * destroys the given cpupool
  * returns 0 on success, 1 else
@@ -379,6 +382,7 @@ static int cpupool_destroy(struct cpupool *c)
     debugtrace_printk("cpupool_destroy(pool=%u)\n", c->cpupool_id);
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Move domain to another cpupool
@@ -568,6 +572,7 @@ static int cpupool_unassign_cpu_start(struct cpupool *c, unsigned int cpu)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 static long cf_check cpupool_unassign_cpu_helper(void *info)
 {
     struct cpupool *c = info;
@@ -633,6 +638,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     }
     return continue_hypercall_on_cpu(work_cpu, cpupool_unassign_cpu_helper, c);
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * add a new domain to a cpupool
@@ -810,6 +816,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
     rcu_read_unlock(&sched_res_rculock);
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * do cpupool related sysctl operations
  */
@@ -975,6 +982,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     return ret;
 }
+#endif /* CONFIG_SYSCTL */
 
 unsigned int cpupool_get_id(const struct domain *d)
 {
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 3129fc602d..0292233c7e 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -249,12 +249,12 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         copyback = 0;
     }
     break;
-#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_cpupool_op:
         ret = cpupool_do_sysctl(&op->u.cpupool_op);
         break;
 
+#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_scheduler_op:
         ret = sched_adjust_global(&op->u.scheduler_op);
         break;
-- 
2.34.1


