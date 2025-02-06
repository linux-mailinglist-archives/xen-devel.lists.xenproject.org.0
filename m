Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078D6A29E3F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882391.1292536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO1-0007mH-W6; Thu, 06 Feb 2025 01:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882391.1292536; Thu, 06 Feb 2025 01:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO1-0007jr-Ql; Thu, 06 Feb 2025 01:08:57 +0000
Received: by outflank-mailman (input) for mailman id 882391;
 Thu, 06 Feb 2025 01:08:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqO0-0007da-FA
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2416::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edc70554-e426-11ef-99a4-01e77a169b0f;
 Thu, 06 Feb 2025 02:08:53 +0100 (CET)
Received: from CH0PR03CA0372.namprd03.prod.outlook.com (2603:10b6:610:119::10)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 01:08:48 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::a1) by CH0PR03CA0372.outlook.office365.com
 (2603:10b6:610:119::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 01:08:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:46 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:46 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:45 -0600
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
X-Inumbo-ID: edc70554-e426-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNm5QNLlorlt3/TlIa/uwrv5K1+ub4+IEO/IewBa/g/gLF5wbEr7yrMIOVzQZnv+afF48Kf+UhvhjDsmhuhJnAIApxxXURdyMVPrau0Phd9sk7fj2tN6zmcX4Lfc6d4VA2FwsHpOmGDnoJmuwc9SlmgsoqN/ypwfjUJjFrrUvR4UVM+4oHR2xhU4isSVEZ3pcx75/7m5UKQIfgQBc2WzwgxjaUZVELTtQxGdttbdLLimwkzISZzK+4UBuG/9tlv7MrBxicEXXDZEl4K3vl6ZcEwUE7IG3ex++gXk8o51ST6uQbw7RvJwDUCPeeU9W7jxdphWE1+1GvSbDY90V2jDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUIUm8JK5BMrlB7INKTLnuqdNEBW+PMJP6Ejj8B8vic=;
 b=yOeYRztnlfoH6rGHz/xAXpHC9GZX55G9sXyVsy4m+uqRCHc0t6IWosOT7WmcmIHfVlKiKIxEMu7L1x53X2PF3DnygKal4iOfULV82zHf/YGdnYFEJJReil9n/gm5ZNcv8lb8vSWD8XRR+utQKAcxAho+GhyG4cpN54qAelyDyBuUY2JgrWr2Qi9sZZS5Y3vdM7NXtmjpyFt6tjPk7rn/5MPSPYSJrmylqoPpxWBg8X/Ilbk6fXkr9jDuCpmhDz2RUuUJJdlmb0Vu3Dvc0o7Dv62kxlPNrj05OwQ0UU++SDMGUpTaOqM5+c/E0XolppfcTdaBYl2mKBDL8bVbZ/YeQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUIUm8JK5BMrlB7INKTLnuqdNEBW+PMJP6Ejj8B8vic=;
 b=L5nWpg6Kq7rtvU2iJ58x7zArQ2LoWHWi7GPTkPiKjZZd26z5xOtk0x1YPhJHMytxqxHl3XwKA7yRbctGCT7O3FWIQuhpuJzaPke4Mn/BKKbK4A9np7Ti0xMpZRUOpSfxIDV9pv1ne92t6n87zMnKSktchByfhqnIE55MBmzGwIY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v5 2/9] xen/arm/static-shmem: Static-shmem should be direct-mapped for direct-mapped domains
Date: Wed, 5 Feb 2025 17:08:36 -0800
Message-ID: <20250206010843.618280-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c632609-00ab-41db-e1d5-08dd464acf40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OnIAo1jI1Y6o1lYDY/paHw1KrkVXwMbPW37/Ud/2cq7E+XUWk1SDNV1n8wX/?=
 =?us-ascii?Q?bUADCZYpuj8PC8H92t7baRXQc0lkAa1ruABd7pRwO1JmueeB9rtU2hZRmd45?=
 =?us-ascii?Q?fVBss2GR62hI41VL9u1CYxNnb+y766q0YZTSl1gKM26SisqaDjEmbXiTrY1o?=
 =?us-ascii?Q?9CNoPcNGWzDpMqSeEQokAo9oJ1HMCNSLy4+YUxF70KtMvYyPzvmOte9DWs5T?=
 =?us-ascii?Q?yYITs7TPESBwSI1eon5g0zd72dfPpuLxrlQ7vuJ3gSmU/LsNqWF8eFNM8h9m?=
 =?us-ascii?Q?7zs1AlUjp9fRP+cAnnroDcI/cSlUsSPO+Qig6m6uUyaaI7ZUx6mGbUzP3dNP?=
 =?us-ascii?Q?6L0Kp+C4Am2IF0YHSOBVA55xrhIW+s1bCGAmIvmbCmIjgGjJG2PbRVH1DNTj?=
 =?us-ascii?Q?V4pQuIQY6ao5UpdekKVkCZzed8ct42tvhNoJlV2YeU13vFfYwzcYYZ63tMQ0?=
 =?us-ascii?Q?4ZVDvmVoIXnXczg8Swty+fhucNGAgfGZygUI9RNdPLvrnTBnfIH399lR8XwC?=
 =?us-ascii?Q?WqpKPYZZMjSY14Dnbvq9SiraWpkKrUcgpHzeC8jNAyfAkbOJYSsG+pZYUayn?=
 =?us-ascii?Q?Ejj+Gdk0sM91Y0YavWThwHVlTAyvI82WeqKXGJZQ1g88SZtQcEUb1yvxpZc9?=
 =?us-ascii?Q?TWRgrdgADWxuL1VlDo0w9l69OQS2Rj7cw4HVFFlpVYGR6g3IrjwLTq9LtDIa?=
 =?us-ascii?Q?obuxA2C39TMRZkD0ukZ02Uc2NW4wEgGh4D1qwRW5maqjzepD3mhp1bl1H3YQ?=
 =?us-ascii?Q?WNIvPWdqEoSt1/ksVUgmOQM2qW9m4tGl7BMD/ixj2bBs++deLgwlgM+igKPK?=
 =?us-ascii?Q?6xze6KYLTosm1Pksly0aDsbTVDKK9AxsE3Zq1SxdOraNa0hxRm+3W2P8dDR6?=
 =?us-ascii?Q?3wQMcZdUULC+jjppFPacUOrfOHRzNl37V5D+RADCDXGhGoDz+XUK9m8MC583?=
 =?us-ascii?Q?VXCnROFvNdellp24+z6SKKlM9HAiR5RXEhhZlhsI7G4G/+8OgYIBfgbfKaIh?=
 =?us-ascii?Q?2Fd7T49+XsV6p58NlrFmZ+qwQD5K3X05TsYaPehuer6O97KoSY7t2eJaJ17o?=
 =?us-ascii?Q?/VMYmysapY/9q7mBWoeITaV2CkmpBmpIauBYnqFJMCGYiER9GhqV3EQhPqPV?=
 =?us-ascii?Q?2MfiQq+f+e1Rnswcx60sWNk4IxaGecB1SqDIaMHRz46p77HMt9sWnghs9tzd?=
 =?us-ascii?Q?5WsbKjdRb9NK56/OVBEXMhKN8nbeSlrVnXpp1h2My5NqAoVJLy5/voW5hf68?=
 =?us-ascii?Q?zzYPrqxmnLWDVUMJPcpVDErfmQKd53ovFyO6VSS4hhKhgRIaooR/c0gCJbao?=
 =?us-ascii?Q?w3zo3wZconaLrdSIcrw78N/DpPJAoIJC4FFdWZkSGhMZayzbvNx37J2tf2Ob?=
 =?us-ascii?Q?HxUFSCmjpr2+7SN+q+Fhb5CHL70rO3rsI3i+6F3+FQHNxAx6zpOzaqQAAllg?=
 =?us-ascii?Q?IOsTq1ppHQdsUHRM61qiKH+VCzaqX+cETQw8NeqWTaCvVeHiwLoX34OSdUXs?=
 =?us-ascii?Q?GwfR1ZbniKDAGUw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:47.4201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c632609-00ab-41db-e1d5-08dd464acf40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142

From: Henry Wang <xin.wang2@amd.com>

Currently, users are allowed to map static shared memory in a
non-direct-mapped way for direct-mapped domains. This can lead to
clashing of guest memory spaces. Also, the current extended region
finding logic only removes the host physical addresses of the
static shared memory areas for direct-mapped domains, which may be
inconsistent with the guest memory map if users map the static
shared memory in a non-direct-mapped way. This will lead to incorrect
extended region calculation results.

To make things easier, add restriction that static shared memory
should also be direct-mapped for direct-mapped domains. Check the
host physical address to be matched with guest physical address when
parsing the device tree. Document this restriction in the doc.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/device-tree/booting.txt | 3 +++
 xen/arch/arm/static-shmem.c           | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 9c881baccc..ff70d44462 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -615,6 +615,9 @@ communication.
     Note that if a domain is direct-mapped, i.e. the Dom0 and the Dom0less
     DomUs with `direct-map` device tree property, the static shared memory
     should also be direct-mapped (host physical address == guest address).
+    Note that if a domain is direct-mapped, i.e. the Dom0 and the Dom0less
+    DomUs with `direct-map` device tree property, the static shared memory
+    should also be direct-mapped (host physical address == guest address).
 
     It shall also meet the following criteria:
     1) If the SHM ID matches with an existing region, the address range of the
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 8f87154c35..44eeac2a23 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -325,6 +325,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
             printk("%pd: static shared memory bank not found: '%s'", d, shm_id);
             return -ENOENT;
         }
+        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
+        {
+            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
+                   d, pbase, gbase);
+            return -EINVAL;
+        }
 
         pbase = boot_shm_bank->start;
         psize = boot_shm_bank->size;
-- 
2.25.1


